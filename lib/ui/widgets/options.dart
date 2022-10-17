import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/password/password_cubit.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/password_opener.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Passwords'),
          const Divider(),
          BlocBuilder<PasswordCubit, PasswordState>(
            builder: (context, state) {
              if (state is PasswordData) {
                if (state.passwords.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.passwords.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PasswordOpener(
                        password: state.passwords[index],
                      );
                    },
                  );
                } else {
                  return const Text('No passwords added.');
                }
              } else {
                return const SizedBox();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text('Actions'),
          ),
          const Divider(),
          TextButton(
            onPressed: () => BlocProvider.of<UserCubit>(context).logOut(),
            child: const Text('Log out'),
          )
        ],
      ),
    );
  }
}
