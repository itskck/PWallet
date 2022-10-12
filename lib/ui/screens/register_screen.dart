import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
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
    final passwordController = TextEditingController();
    final loginController = TextEditingController();
    print(BlocProvider.of<UserCubit>(context).state.toString());
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedIn) {
          GoRouter.of(context).go('/home');
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
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
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
