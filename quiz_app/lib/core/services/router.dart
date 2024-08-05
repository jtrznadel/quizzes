import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/features/auth/presentation/views/login_screen.dart';
import 'package:quiz_app/main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _fadePageBuilder(
          (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          settings: settings);
    case LoginScreen.routeName:
      return _fadePageBuilder((context) => const LoginScreen(),
          settings: settings);
    default:
      return _fadePageBuilder(
          (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _fadePageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, _, __) => page(context),
  );
}

PageRouteBuilder<dynamic> _slidePageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => page(context),
  );
}
