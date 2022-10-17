part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordData extends PasswordState {
  const PasswordData(this.passwords, this.passwordShow);

  final List<Password> passwords;
  final Widget passwordShow;

  @override
  List<Object> get props => [passwords, passwordShow];
}
