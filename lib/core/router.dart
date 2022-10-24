import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/ui/screens/login_screen.dart';
import 'package:pwallet/ui/screens/new_password_screen.dart';
import 'package:pwallet/ui/screens/pass_page.dart';
import 'package:pwallet/ui/screens/password_add_screen.dart';
import 'package:pwallet/ui/screens/register_screen.dart';

class MyRouter {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) {
          if (BlocProvider.of<UserCubit>(context).state is UserLoggedIn) {
            return '/home';
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
        redirect: (context, state) {
          if (BlocProvider.of<UserCubit>(context).state is UserLoggedIn) {
            return '/home';
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => PassPage(
          user: BlocProvider.of<UserCubit>(context).currentUser,
        ),
        redirect: (context, state) {
          if (BlocProvider.of<UserCubit>(context).state is UserLoggedOut) {
            return '/';
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => PasswordAddScreen(),
        redirect: (context, state) {
          if (BlocProvider.of<UserCubit>(context).state is UserLoggedOut) {
            return '/';
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => NewPasswordScreen(),
        redirect: (context, state) {
          if (BlocProvider.of<UserCubit>(context).state is UserLoggedOut) {
            return '/';
          } else {
            return null;
          }
        },
      )
    ],
  );
}
