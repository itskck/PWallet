import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/options.dart';
import 'package:pwallet/ui/widgets/pass_add_fab.dart';
import 'package:pwallet/ui/widgets/password_shown.dart';

class PassPage extends StatelessWidget {
  const PassPage({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOut) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is UserLoggedIn) {
          return Scaffold(
            floatingActionButton: const PassAddFab(),
            body: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.2,
                    child: Options(
                      passwords: state.passwords,
                      user: state.user,
                    ),
                  ),
                  const VerticalDivider(),
                  SizedBox(
                    width: width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: state.passwordShow != null
                          ? PasswordShown(password: state.passwordShow!)
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
