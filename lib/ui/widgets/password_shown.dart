import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/utils/encrypter.dart';
import 'package:pwallet/utils/utils.dart';

class PasswordShown extends StatefulWidget {
  const PasswordShown({
    super.key,
    required this.password,
  });

  final Password password;

  @override
  State<PasswordShown> createState() => _PasswordShownState();
}

class _PasswordShownState extends State<PasswordShown> {
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController passwordDecodedController;
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController(text: widget.password.login);
    passwordController = TextEditingController(text: widget.password.password);
    passwordDecodedController = TextEditingController();
    showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.password.webAddress,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              widget.password.descritpion,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                readOnly: true,
                controller: loginController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                readOnly: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Encrypted password',
                ),
              ),
            ),
            SwitchListTile(
              title: const Text('Decrpyt and show password'),
              value: showPassword,
              onChanged: (value) {
                if (value) {
                  passwordDecodedController.text = Encrypter.decryptPassword(
                    widget.password.password,
                    BlocProvider.of<UserCubit>(context).currentUser!.salt,
                  );
                }
                setState(() {
                  showPassword = value;
                });
              },
            ),
            if (showPassword)
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  readOnly: true,
                  controller: passwordDecodedController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    loginController.dispose();
    super.dispose();
  }
}
