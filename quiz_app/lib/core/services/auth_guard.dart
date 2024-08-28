import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/auth_controller.dart';
import 'app_router.dart';
import 'session_provider.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = await ref.read(sessionProvider).isAuthenticated();
    debugPrint('Guard triggered for route: ${resolver.route.name}');
    debugPrint('isAuthenticated: $isAuthenticated');
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(const WelcomeRoute());
    }
  }
}
