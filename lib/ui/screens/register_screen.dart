import 'package:flutter/material.dart';
import 'package:pwallet/utils/encrypter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool checkboxState;

  @override
  void initState() {
    super.initState();
    checkboxState = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Create new account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login',
                    hintText: 'Enter your login',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your master password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: checkboxState,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Use SHA512'),
                  onChanged: (value) {
                    setState(() {
                      checkboxState = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Encrypter.generateSHA512('hihu');
                },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 40)),
                child: const Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
