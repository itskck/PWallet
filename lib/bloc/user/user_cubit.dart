import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pwallet/bloc/user/user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserLoggedOut());

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return UserLoggedIn(json['id'] as int);
    } else {
      return UserLoggedOut();
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    if (state is UserLoggedIn) {
      return {
        'id': state.id,
      };
    } else {
      return {};
    }
  }
}
