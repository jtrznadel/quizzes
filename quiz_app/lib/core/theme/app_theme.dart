import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/app_input_decoration_theme.dart';
import 'package:quiz_app/core/theme/app_text_theme.dart';
import 'app_color_scheme.dart';

abstract class AppTheme {
  static const double pageDefaultSpacingSize = 16;

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColorScheme.primary,
      onPrimary: AppColorScheme.onPrimary,
      secondary: AppColorScheme.secondary,
      onSecondary: AppColorScheme.onSecondary,
      surface: AppColorScheme.surface,
      surfaceContainer: AppColorScheme.surfaceContainer,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorScheme.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.labelLarge,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColorScheme.surface,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
  );
}
