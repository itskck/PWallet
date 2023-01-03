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
  );

  final User user;
  final List<Password> passwords;
  final Password? passwordShow;
  final bool currentPasswordEditable;

  @override
  List<Object?> get props => [user, passwords, passwordShow];
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
