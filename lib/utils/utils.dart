import 'package:encrypt/encrypt.dart' as e;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pwallet/utils/encrypter.dart';

void showDialogBox(BuildContext context, Widget content) {
  showDialog<Widget>(
    context: context,
    builder: (context) => content,
  );
}

void showGoodToast(String text) {
  Fluttertoast.showToast(
    textColor: Colors.white,
    msg: text,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    webBgColor: 'linear-gradient(to right, #5a3699, #b65bbd)',
  );
}

void showBadToast(String text) {
  Fluttertoast.showToast(
    textColor: Colors.white,
    msg: text,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    webBgColor: 'linear-gradient(to right, #bd1937, #7a2d2d)',
  );
}
