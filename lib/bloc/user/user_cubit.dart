import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/constants.dart';
import 'package:pwallet/data/network/rest_client.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/utils/encrypter.dart';
import 'package:pwallet/utils/utils.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoggedOut());

  MyDatabase database = MyDatabase();

  User? get currentUser {
    if (state is UserLoggedIn) {
      return (state as UserLoggedIn).user;
    } else {
      return null;
    }
  }

  Future<List<Password>> get userPasswords async {
    return database.getAllUserPasswords(currentUser!.id);
  }

  Future<void> registerUser({
    required bool useSha,
    required String password,
    required String login,
  }) async {
    try {
      final users = await database.getAllUsers();
      if (users.any((element) => element.login == login)) {
        showBadToast('User with that login already exists');
        throw Exception();
      }
      final salt = Encrypter.getRandomString(32);
      var md = '';
      if (useSha) {
        md = Encrypter.generateSHA512('$salt$pepper$password');
      } else {
        md = Encrypter.generateHMAC(password, salt);
      }
      final companion = UsersCompanion(
        login: Value(login),
        passwordHash: Value(md),
        salt: Value(salt),
        isPasswordKeptAsHash: Value(useSha),
      );

      final ipResponse = await RestClient.getIpData();
      final String ip = ipResponse.ip!;

      final ipCompanion = IpAddressesCompanion(
        ipAddress: Value(ip),
      );

      await database.addUser(companion);
      await database.addIp(ipCompanion);

      emit(UserRegisterDone());
    } catch (e, s) {
      emit(UserLoggedOut());
      log(
        'Error while registering',
        stackTrace: s,
      );
    }
  }

  Future<void> addPassword(
      {required String password,
      required String address,
      required String description,
      required String login}) async {
    final hash = Encrypter.encryptPassword(password, currentUser!.salt);
    final companion = PasswordsCompanion(
      password: Value(hash),
      idUser: Value(currentUser!.id),
      webAddress: Value(address),
      descritpion: Value(description),
      login: Value(login),
    );
    await database.addPassword(companion);
    final passwords = await database.getAllUserPasswords(
      currentUser!.id,
    );
    emit(
      UserLoggedIn(
        currentUser!,
        passwords,
        null,
      ),
    );
  }

  Future<void> editPassword(int id, String password) async {
    try {
      final hash = Encrypter.encryptPassword(password, currentUser!.salt);
      await database.editPassword(id, hash);
      final passwords = await database.getAllUserPasswords(
        currentUser!.id,
      );
      emit(
        UserLoggedIn(
          currentUser!,
          passwords,
          null,
        ),
      );
    } catch (e, s) {
      log(
        'Error while editing password',
        stackTrace: s,
      );
      showBadToast('Error while editing password');
    }
  }

  Future<void> removePassword(int id) async {
    try {
      final user = currentUser!;

      await database.removePassword(id);
      final passwords = await database.getAllUserPasswords(
        currentUser!.id,
      );
      emit(
        UserLoggedIn(
          user,
          passwords,
          null,
        ),
      );
    } catch (e, s) {
      log(
        'Error while deleting password',
        stackTrace: s,
      );
      showBadToast('Error while deleting password');
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      var md = '';

      if (currentUser!.isPasswordKeptAsHash) {
        md =
            Encrypter.generateSHA512('${currentUser!.salt}$pepper$oldPassword');
      } else {
        md = Encrypter.generateHMAC(oldPassword, currentUser!.salt);
      }

      if (md == currentUser!.passwordHash) {
        final newSalt = Encrypter.getRandomString(32);
        if (currentUser!.isPasswordKeptAsHash) {
          md = Encrypter.generateSHA512('$newSalt$pepper$newPassword');
        } else {
          md = Encrypter.generateHMAC(newPassword, newSalt);
        }

        final passwords = await database.getAllUserPasswords(currentUser!.id);
        await database.removeAllUserPasswords(currentUser!.id);
        await database.updatePassword(md, newSalt, currentUser!.id);
        List<Password> tempPasswords = [];
        List<String> decryptedPasswords = [];

        for (int i = 0; i < passwords.length; i++) {
          decryptedPasswords.add(
            Encrypter.decryptPassword(passwords[i].password, currentUser!.salt),
          );
          tempPasswords.add(
            passwords[i].copyWith(
              password:
                  Encrypter.encryptPassword(decryptedPasswords[i], newSalt),
            ),
          );
          await database.addPassword(
            PasswordsCompanion(
              password: Value(tempPasswords[i].password),
              idUser: Value(currentUser!.id),
              webAddress: Value(tempPasswords[i].webAddress),
              descritpion: Value(tempPasswords[i].descritpion),
              login: Value(tempPasswords[i].login),
            ),
          );
        }

        showGoodToast('Password changed');
        emit(UserLoggedOut());
      } else {
        showBadToast(
          'Error! Entered password is not maching your current password.',
        );
        throw Exception();
      }
    } catch (e, s) {
      log(
        'Error while changing password',
        stackTrace: s,
      );
    }
  }

  Future<void> loginUser({
    required String password,
    required String login,
  }) async {
    try {
      final user = await database.getUserByLogin(login);
      final ip = (await RestClient.getIpData()).ip!;
      var ipObj = await database.ipAddressByIp(ip);

      var md = '';

      if (user.isPasswordKeptAsHash) {
        md = Encrypter.generateSHA512('${user.salt}$pepper$password');
      } else {
        md = Encrypter.generateHMAC(password, user.salt);
      }

      if (md == user.passwordHash) {
        if (ipObj.blockedUntill != null &&
            ipObj.blockedUntill!.isAfter(DateTime.now())) {
          emit(UserLoggedOut());
          showBadToast('IP Blocked untill ${ipObj.blockedUntill}');
        } else {
          final passwords = await database.getAllUserPasswords(user.id);

          await database.registerSuccessfulLogin(ip);
          print('password good');
          emit(
            UserLoggedIn(
              user,
              passwords,
              null,
            ),
          );
          showGoodToast('Logged Successfuly');
        }
      } else {
        await database.registerUnsuccessfulLogin(ip);
        ipObj = await database.ipAddressByIp(ip);
        print('password bad');
        if (ipObj.blockedUntill != null &&
            ipObj.blockedUntill!.isAfter(DateTime.now())) {
          emit(UserLoggedOut());
          showBadToast('IP Blocked untill ${ipObj.blockedUntill}');
        }
        emit(UserLoggedOut());
      }
      print(ipObj);
    } catch (e, s) {
      showBadToast('Exception occured while logging in');
      emit(UserLoggedOut());
      log(
        'Error while loging in',
        stackTrace: s,
      );
    }
  }

  Future<void> setShownWidget(Password password) async {
    final passwords = await userPasswords;
    final user = currentUser!;

    emit(
      UserLoggedIn(
        user,
        passwords,
        password,
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    try {
      emit(UserLoggedOut());
    } catch (e, s) {
      emit(UserLoggedOut());
      log(
        'Error while loging out',
        stackTrace: s,
      );
    }
  }
}
