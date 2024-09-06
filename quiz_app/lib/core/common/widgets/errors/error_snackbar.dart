import 'package:flutter/material.dart';

import '../info_snackbar.dart';

class ErrorSnackbar {
  static void show(BuildContext context, String message) {
    InfoSnackbar.show(context, message, color: Colors.red);
  }
}