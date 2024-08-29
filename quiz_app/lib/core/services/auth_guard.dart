import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_router.dart';
import 'session_provider.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = ref.read(sessionProvider).isAuthenticated();
    if (await isAuthenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(const WelcomeRoute());
    }
  }
}
