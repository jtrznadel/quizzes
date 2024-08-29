import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'app_input_decoration_theme.dart';
import 'app_text_theme.dart';

abstract class AppTheme {
  static const double pageDefaultSpacingSize = 16;
  static const double answerTextAreaPadding = 8;
  static const double quizStatusBadgeVerticalPadding = 8;
  static const double statusBadgeBorderRadius = 32;
  static const double quizAttemptItemBorderRadius = 8;
  static const double buttonBorderRadius = 48;
  static const double buttonVerticalPadding = 12;
  static const double buttonBorderWidth = 0.5;
  static const double dottedBorderWidth = 1.5;

  static const double forgotPasswordSuccessScreenPadding = 25;
  static const double forgotPasswordSuccessDescriptionWidth = 225;

  static const double dashboardQuizItemBottomPadding = 16;
  static const double dashboardUserProfileIconSize = 24;
  static const double dashboardNewQuizIconSize = 32;
  static const double dashboardAddNewButtonBorderRadius = 8;
  static const double dashboardAddNewButtonHeight = 200;

  static const double quizDeleteDialogItemBorderRadius = 8;

  static const double snackBarBorderRadius = 8;

  static const double quizListItemPadding = 24;
  static const double quizListItemBorderRadius = 8;
  static const double quizListItemDeleteIconSize = 24;
  static const double quizListItemIconPadding = 4;

  static const double profileScreenDeleteAccountDialogTextPadding = 8;

  static const double bottomSheetVerticalPadding = 24;
  static const double bottomSheetHorizontalPadding = 16;

  static const double textCheckboxDefaultHeight = 24;
  static const double textCheckboxDefaultWidth = 24;
  static const double textCheckboxBorderRadius = 5;
  static const double textCheckboxCheckmarkPadding = 4.5;
  static const double textCheckboxBorderWidth = 2;
  static const double textCheckboxVerticalPadding = 6;

  static const double checkboxDefaultHeight = 24;
  static const double checkboxDefaultWidth = 24;

  static const double extraSmallSpacerValue = 4;
  static const double smallSpacerValue = 8;
  static const double mediumSpacerValue = 16;
  static const double largeSpacerValue = 24;
  static const double extraLargeSpacerValue = 40;

  static const double addQuestionDialogAnswerHorizontalSpacer = 12;
  static const addQuestionDialogTextAreaHeight = 20 / 14;

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
