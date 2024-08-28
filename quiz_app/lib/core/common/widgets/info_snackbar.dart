import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../extensions/context_extension.dart';
import '../../theme/app_color_scheme.dart';
import '../../theme/app_theme.dart';

void showCustomSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: context.textTheme.bodyMedium!.copyWith(
        color: AppColorScheme.textContrast,
      ),
    ),
    backgroundColor: AppColorScheme.textPrimary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTheme.snackBarBorderRadius),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
