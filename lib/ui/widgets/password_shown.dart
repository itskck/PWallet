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
  late bool editMode;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController(text: widget.password.login);
    passwordController = TextEditingController(text: widget.password.password);
    passwordDecodedController = TextEditingController();
    showPassword = false;
    editMode = false;
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
                  editMode = false;
                });
              },
            ),
            if (showPassword)
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  readOnly: !editMode,
                  controller: passwordDecodedController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (!editMode) {
                      if (!showPassword) {
                        passwordDecodedController.text =
                            Encrypter.decryptPassword(
                          widget.password.password,
                          BlocProvider.of<UserCubit>(context).currentUser!.salt,
                        );
                      }
                      setState(() {
                        editMode = true;
                        showPassword = true;
                      });
                    } else {
                      BlocProvider.of<UserCubit>(context).editPassword(
                        widget.password.id,
                        passwordDecodedController.text,
                      );
                      setState(() {
                        editMode = false;
                      });
                    }
                  },
                  icon: Icon(
                    editMode ? Icons.save : Icons.edit,
                    color: const Color.fromARGB(255, 68, 68, 68),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () => BlocProvider.of<UserCubit>(context)
                      .removePassword(widget.password.id),
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 197, 92, 92),
                  ),
                )
              ],
            )
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
