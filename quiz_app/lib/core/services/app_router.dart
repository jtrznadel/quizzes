import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/domain/entities/test_quiz_entity.dart';
import '../../features/take_quizz/presentation/views/take_quizz_page.dart';
import '../../features/take_quizz/presentation/views/take_quizz_wraper_page.dart';
import '../common/widgets/errors/basic_error_page.dart';
import 'auth_guard.dart';

import '../../features/auth/presentation/views/forgot_pasword_page.dart';
import '../../features/auth/presentation/views/new_password_page.dart';
import '../../features/auth/presentation/views/sign_in_page.dart';
import '../../features/auth/presentation/views/sing_up_page.dart';
import '../../features/auth/presentation/views/successful_password_reset_request_page.dart';
import '../../features/auth/presentation/views/welcome_page.dart';
import '../../features/dashboard/presentation/views/dashboard_page.dart';
import '../../features/profile/presentation/views/profile_page.dart';
import '../../features/quiz_generation/views/quizz_creation_page.dart';
import '../../features/quizz_details/presentation/views/quizz_details_page.dart';
import '../../temp_page.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: WelcomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: SuccessfulPasswordResetRequestRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        CustomRoute(
          page: DashboardRoute.page,
          guards: [AuthGuard(ref)],
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
        AutoRoute(page: ProfileRoute.page, guards: [AuthGuard(ref)]),
        AutoRoute(page: QuizzCreationRoute.page, guards: [AuthGuard(ref)]),
        AutoRoute(page: QuizzDetailsRoute.page, guards: [AuthGuard(ref)]),
        AutoRoute(page: BasicErrorRoute.page),,
        AutoRoute(page: TakeQuizzRoute.page, guards: [AuthGuard(ref)]),
        AutoRoute(page: TakeQuizzWraperRoute.page, guards: [AuthGuard(ref)]),
      ];
}
