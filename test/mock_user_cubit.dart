import 'package:bloc_test/bloc_test.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';

class MockUserCubit extends MockCubit<UserState> implements UserCubit {}
