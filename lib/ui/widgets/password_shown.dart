import 'package:flutter/material.dart';
import 'package:pwallet/data/wallet_data.dart';

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
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    loginController = TextEditingController(text: widget.password.login);
    passwordController = TextEditingController(text: widget.password.password);

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
                controller: passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
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
