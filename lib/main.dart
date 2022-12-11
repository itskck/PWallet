import 'package:flutter/material.dart';
import 'package:pwallet/core/app.dart';
import 'package:pwallet/data/network/rest_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var data = await RestClient.getIpData();
  print(data.toString());
  runApp(const App());
}
