import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showDialogBox(BuildContext context, Widget content) {
  showDialog<Widget>(
    context: context,
    builder: (context) => content,
  );
}

void showToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    webBgColor: 'linear-gradient(to right, #5a3699, #b65bbd)',
  );
}
