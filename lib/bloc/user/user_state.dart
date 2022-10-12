import 'package:equatable/equatable.dart';
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
  UserLoggedIn(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
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
