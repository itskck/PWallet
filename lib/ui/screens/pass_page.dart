import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/data/wallet_data.dart';

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
        body: Center(
          child: Column(
            children: [
              Text('Siemanko ${widget.user!.login}'),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).logOut();
                  },
                  child: Text('Log out'))
            ],
          ),
        ),
      ),
    );
  }
}
