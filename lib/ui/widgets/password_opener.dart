import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwallet/bloc/password/password_cubit.dart';
import 'package:pwallet/data/wallet_data.dart';
import 'package:pwallet/ui/widgets/options.dart';

class PasswordOpener extends StatelessWidget {
  const PasswordOpener({
    super.key,
    required this.password,
  });

  final Password password;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(password.webAddress),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () =>
          BlocProvider.of<PasswordCubit>(context).setShownWidget(password),
    );
  }

  String siteNameFromUrl(String url) {
    var name = '';
    try {
      final uri = Uri.tryParse(name);
      if (uri == null) throw (Exception('Uri not in correct format'));
      name = uri.host;
    } catch (e) {
      name = url;
    }

    return name;
  }
}
