import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pwallet/data/wallet_data.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserChangingState extends UserState {
  UserChangingState();

  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends UserState {
  UserLoggedIn(
    this.user,
    this.passwords,
    this.passwordShow,
    this.currentPasswordEditable,
    this.logs,
  );

  final User user;
  final List<Password> passwords;
  final Password? passwordShow;
  final bool currentPasswordEditable;
  final List<Log> logs;

  @override
  List<Object?> get props => [
        user,
        passwords,
        passwordShow,
        currentPasswordEditable,
        logs,
      ];
}

class UserRegisterDone extends UserState {
  UserRegisterDone();
  @override
  List<Object?> get props => [];
}

class UserLoggedOut extends UserState {
  UserLoggedOut();

  @override
  List<Object?> get props => [];
}
