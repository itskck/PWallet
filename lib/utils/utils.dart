import 'package:flutter/material.dart';

showDialogBox(BuildContext context, Widget content) {
  showDialog(
    context: context,
    builder: (context) => content,
  );
}
