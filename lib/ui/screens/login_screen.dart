import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/bloc/user/user_state.dart';
import 'package:pwallet/constants.dart';
import 'package:pwallet/data/wallet_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedIn) {
          GoRouter.of(context).push('/home');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width > minDekstopWidth
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_4eynavd0.json',
                      height: 400,
                      width: 400,
                      frameRate: FrameRate.max,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: SelectableText(
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
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).loginUser(
                      password: passwordController.text,
                      login: loginController.text,
                    );
                    loginController.clear();
                    passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 40),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).resetIpAddress();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 40),
                  ),
                  child: const Text('Reset my IP address'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     final db = MyDatabase();
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => DriftDbViewer(db),
                //       ),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     fixedSize: const Size(400, 40),
                //   ),
                //   child: const Text('Show db'),
                // ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
