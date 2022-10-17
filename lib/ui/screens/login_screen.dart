import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final loginController = TextEditingController();
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedIn) {
          GoRouter.of(context).go('/home');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_4eynavd0.json',
                    height: 400,
                    width: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Password wallet',
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
                  TextButton(
                    onPressed: () => GoRouter.of(context).go('/register'),
                    child: const Text('Create new account'),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<UserCubit>(context).loginUser(
                password: passwordController.text,
                login: loginController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 40),
            ),
            child: const Text('Login'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
