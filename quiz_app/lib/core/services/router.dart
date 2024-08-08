import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/features/auth/presentation/views/forgot_pasword_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/new_password_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/sing_up_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/successful_password_reset_request_screen.dart';

import 'package:quiz_app/features/auth/presentation/views/welcome_screen.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/temp.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _fadePageBuilder((context) => const TempScreen(), settings: settings);
    case WelcomeScreen.routeName:
      return _fadePageBuilder((context) => const WelcomeScreen(), settings: settings);
    case SignInScreen.routeName:
      return _slidePageBuilder((context) => const SignInScreen(), settings: settings);
    case SignUpScreen.routeName:
      return _slidePageBuilder((context) => const SignUpScreen(), settings: settings);
    case '/forgot-password':
      return _fadePageBuilder((context) => const ForgotPasswordScreen(), settings: settings);
    case SuccessfulPasswordResetRequestScreen.routeName:
      return _fadePageBuilder((context) => const SuccessfulPasswordResetRequestScreen(), settings: settings);
    case NewPasswordScreen.routeName:
      return _fadePageBuilder((context) => const NewPasswordScreen(), settings: settings);
    default:
      return _slidePageBuilder((context) => const TempScreen(), settings: settings);
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
