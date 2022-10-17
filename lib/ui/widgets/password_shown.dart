import 'package:flutter/material.dart';
import 'package:pwallet/data/wallet_data.dart';

class PasswordShown extends StatelessWidget {
  const PasswordShown({
    super.key,
    required this.password,
  });

  final Password password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(password.webAddress),
      ],
    );
  }
}
