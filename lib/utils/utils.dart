import 'package:flutter/material.dart';

void showDialogBox(BuildContext context, Widget content) {
  showDialog<Widget>(
    context: context,
    builder: (context) => content,
  );
}
