import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/constants.dart';
import 'package:pwallet/utils/encrypter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool checkboxState;
  final passwordController = TextEditingController();
  final loginController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkboxState = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > minDekstopWidth
        ? MediaQuery.of(context).size.width * 0.3
        : MediaQuery.of(context).size.width;

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserRegisterDone) {
          GoRouter.of(context).go('/');
        }
      },
      child: Scaffold(
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: loginController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login',
                      hintText: 'Enter your login',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
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
                    BlocProvider.of<UserCubit>(context).registerUser(
                      useSha: checkboxState,
                      password: passwordController.text,
                      login: loginController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(width, 40)),
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
