import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PassAddFab extends StatelessWidget {
  const PassAddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        GoRouter.of(context).push('/add');
      },
    );
  }
}
