import 'package:flutter/material.dart';
import 'package:quiz_app/generated/l10n.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  NavigatorState get navigator => Navigator.of(this);
}
