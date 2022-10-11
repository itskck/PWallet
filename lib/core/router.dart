import 'package:go_router/go_router.dart';
import 'package:pwallet/ui/screens/login_screen.dart';
import 'package:pwallet/ui/screens/register_screen.dart';

class MyRouter {
  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
