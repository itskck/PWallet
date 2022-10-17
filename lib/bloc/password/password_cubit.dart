import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/password_shown.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit(this.userCubit) : super(const PasswordData([], SizedBox()));

  final UserCubit userCubit;

  List<Password> get currentPasswords =>
      state is PasswordData ? (state as PasswordData).passwords : [];

  factory PasswordCubit.create(BuildContext context) {
    return PasswordCubit(
      BlocProvider.of<UserCubit>(context),
    );
  }

  Future<void> initialize() async {
    final passwords = await userCubit.database.getAllUserPasswords(
      userCubit.currentUser!.id,
    );
    emit(PasswordData(passwords, const SizedBox()));
  }

  Future<void> addPassword({
    required String password,
    required String address,
    required String description,
    required String login,
  }) async {
    final companion = PasswordsCompanion(
      password: Value(password),
      idUser: Value(userCubit.currentUser!.id),
      webAddress: Value(address),
      descritpion: Value(description),
      login: Value(login),
    );
    await userCubit.database.addPassword(companion);
    await initialize();
  }

  void setShownWidget(Password password) {
    emit(
      PasswordData(
        currentPasswords,
        PasswordShown(
          password: password,
        ),
      ),
    );
  }
}
