import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';

class PasswordOpener extends StatelessWidget {
  const PasswordOpener({
    super.key,
    required this.password,
    required this.isTrue,
  });

  final Password password;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isTrue,
      leading: Text(password.webAddress),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => BlocProvider.of<UserCubit>(context).setShownWidget(password),
    );
  }
}
