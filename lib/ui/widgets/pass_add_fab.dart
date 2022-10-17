import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/password/password_cubit.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/ui/screens/password_add_dialog.dart';
import 'package:pwallet/utils/utils.dart';

class PassAddFab extends StatelessWidget {
  const PassAddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // BlocProvider.of<PasswordCubit>(context).addPassword(
        //   password: '31313',
        //   address: 'fasfas',
        //   description: 'description',
        //   login: 'login',
        // );
        showDialogBox(context, const PasswordAddDialog());
      },
    );
  }
}
