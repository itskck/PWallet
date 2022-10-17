import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:pwallet/bloc/password/password_cubit.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/options.dart';
import 'package:pwallet/ui/widgets/pass_add_fab.dart';
import 'package:pwallet/ui/widgets/password_shown.dart';

class PassPage extends StatefulWidget {
  const PassPage({
    super.key,
    this.user,
  });

  final User? user;

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.user == null) {
      GoRouter.of(context).pop();
    }
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOut) {
          GoRouter.of(context).go('/');
        }
      },
      child: Scaffold(
        floatingActionButton: const PassAddFab(),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Options(),
              ),
              Expanded(
                flex: 2,
                child: BlocBuilder<PasswordCubit, PasswordState>(
                  builder: (context, state) {
                    if (state is PasswordData) {
                      return state.passwordShow;
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
