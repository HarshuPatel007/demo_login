import 'package:flutter/material.dart';

showDialogMethod(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}

hideDialogMethod(BuildContext context) {
  Navigator.pop(context);
}
