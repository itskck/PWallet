import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/user/user_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';

class LogRow extends StatelessWidget {
  const LogRow({
    super.key,
    required this.log,
  });

  final Log log;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(log.timestamp.toString()),
        Text(log.ipAddress),
        Text(log.description)
      ],
    );
  }
}
