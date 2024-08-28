import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'session_provider.dart';

import '../../features/auth/presentation/views/forgot_pasword_page.dart';
import '../../features/auth/presentation/views/new_password_page.dart';
import '../../features/auth/presentation/views/sign_in_page.dart';
import '../../features/auth/presentation/views/sing_up_page.dart';
import '../../features/auth/presentation/views/successful_password_reset_request_page.dart';
import '../../features/auth/presentation/views/welcome_page.dart';
import '../../features/dashboard/presentation/views/dashboard_page.dart';
import '../../features/profile/presentation/views/profile_page.dart';
import '../../features/quizz/presentation/views/quizz_creation_page.dart';
import '../../features/quizz/presentation/views/quizz_details_page.dart';
import '../../temp_page.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig()
class AppRouter extends RootStackRouter implements AutoRouteGuard {
  final Ref ref;

  AppRouter(this.ref);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: SuccessfulPasswordResetRequestRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        CustomRoute(
          page: DashboardRoute.page,
          guards: [this],
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
        AutoRoute(page: ProfileRoute.page, guards: [this]),
        AutoRoute(page: QuizzCreationRoute.page, guards: [this]),
        AutoRoute(page: QuizzDetailsRoute.page, guards: [this])
      ];

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
