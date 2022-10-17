import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/password/password_cubit.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/core/app.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) {
            return PasswordCubit.create(context)..initialize();
          },
        )
      ],
      child: child,
    );
  }
}
