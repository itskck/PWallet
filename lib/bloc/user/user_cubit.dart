import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/constants.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/utils/encrypter.dart';

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

  Future<void> registerUser({
    required bool useSha,
    required String password,
    required String login,
  }) async {
    try {
      final salt = Encrypter.getRandomString(password.length);
      var md = '123';
      if (useSha) {
        md = Encrypter.generateSHA512('$salt$pepper$password');
      } else {
        throw Exception('not supported yet');
      }
      final companion = UsersCompanion(
        login: Value(login),
        passwordHash: Value(md),
        salt: Value(salt),
        isPasswordKeptAsHash: Value(useSha),
      );

      await database.addUser(companion);

      emit(UserRegisterDone());
    } catch (e, s) {
      emit(UserLoggedOut());
      log(
        'Error while registering',
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

      var md = '';

      if (user.isPasswordKeptAsHash) {
        md = Encrypter.generateSHA512('${user.salt}$pepper$password');
      } else {
        throw Exception('not supported yet');
      }

      if (md == user.passwordHash) {
        emit(UserLoggedIn(user));
      } else {
        emit(UserLoggedOut());
      }
    } catch (e, s) {
      emit(UserLoggedOut());
      log(
        'Error while loging in',
        stackTrace: s,
      );
    }
  }

  Future<void> logOut() async {
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
