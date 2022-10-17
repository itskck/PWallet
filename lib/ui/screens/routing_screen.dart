import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/ui/screens/login_screen.dart';
import 'package:pwallet/ui/screens/pass_page.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoggedIn) {
          return const PassPage();
        } else if (state is UserLoggedOut) {
          return const LoginScreen();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
