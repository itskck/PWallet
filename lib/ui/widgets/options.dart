import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/password_opener.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.passwords,
    required this.user,
  });

  final List<Password> passwords;
  final User user;

  @override
  Widget build(BuildContext context) {
    Password? pass = (BlocProvider.of<UserCubit>(context).state as UserLoggedIn)
        .passwordShow;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last successful login: ${user.lastSuccessfulLogin} ${user.successfulLoginDetails}',
          ),
          Text(
            'Last unsuccessful login: ${user.lastUnsuccessfulLogin} ${user.unsuccessfulLoginDetails}',
          ),
          const Divider(),
          const Text('Passwords'),
          const Divider(),
          if (passwords.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: passwords.length,
              itemBuilder: (BuildContext context, int index) {
                return PasswordOpener(
                  isTrue: pass != null && pass == passwords[index],
                  password: passwords[index],
                );
              },
            )
          else
            const Text('No passwords added.'),
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text('Actions'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              GoRouter.of(context).push('/change-password');
            },
            leading: Text(
              'Change password',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () => BlocProvider.of<UserCubit>(context).logOut(context),
            leading: Text(
              'Log out',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            trailing: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
