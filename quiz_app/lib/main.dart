import 'package:flutter/material.dart';
import 'package:quiz_app/core/services/router.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
    );
  }
}
