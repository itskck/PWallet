import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pwallet/core/global_providers.dart';
import 'package:pwallet/core/router.dart';
import 'package:pwallet/ui/screens/login_screen.dart';
import 'package:pwallet/utils/no_transitions_builder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp.router(
        theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 83, 57, 126),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              // No animations for every OS if the app running on the web
              for (final platform in TargetPlatform.values)
                platform: const NoTransitionsBuilder(),
            },
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Password wallet',
        routerConfig: MyRouter.routes,
      ),
    );
  }
}
