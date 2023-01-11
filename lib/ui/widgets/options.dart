import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/log_row.dart';
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
    final Password? pass =
        (BlocProvider.of<UserCubit>(context).state as UserLoggedIn)
            .passwordShow;

    final List<Password> userPasswords = [];
    final List<Password> sharedPasswords = [];
    final List<Password> removedPasswords = [];

    for (var p in passwords) {
      if (p.deleted) {
        removedPasswords.add(p);
      } else {
        if (p.sharedFor.split(',').contains(
            BlocProvider.of<UserCubit>(context).currentUser!.id.toString())) {
          sharedPasswords.add(p);
        } else {
          userPasswords.add(p);
        }
      }
    }

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
          if (userPasswords.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: userPasswords.length,
              itemBuilder: (BuildContext context, int index) {
                return PasswordOpener(
                  isTrue: pass != null && pass == userPasswords[index],
                  password: userPasswords[index],
                  editable: true,
                );
              },
            )
          else
            const Text('No passwords added.'),
          const Divider(),
          const Text('Passwords shared for you'),
          const Divider(),
          if (sharedPasswords.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: sharedPasswords.length,
              itemBuilder: (BuildContext context, int index) {
                return PasswordOpener(
                  isTrue: pass != null && pass == sharedPasswords[index],
                  password: sharedPasswords[index],
                  editable: false,
                );
              },
            )
          else
            const Text('No passwords shared.'),
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text('Actions'),
          ),
          const Text('Removed passwords'),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: removedPasswords.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(removedPasswords[index].webAddress),
                trailing: IconButton(
                  icon: const Icon(Icons.rotate_left),
                  onPressed: () => BlocProvider.of<UserCubit>(context)
                      .unremovePassword(removedPasswords[index].id),
                ),
              );
            },
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
          const Text('Logs'),
          const Divider(),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoggedIn) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.logs.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: Divider(),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return LogRow(
                      log: state.logs[state.logs.length - 1 - index],
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
