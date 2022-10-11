import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends UserState {
  UserLoggedIn(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}

class UserLoggedOut extends UserState {
  UserLoggedOut();

  @override
  List<Object?> get props => [];
}
