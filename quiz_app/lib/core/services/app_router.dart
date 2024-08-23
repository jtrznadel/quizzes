import 'package:auto_route/auto_route.dart';

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
import '../../temp.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TempRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: SuccessfulPasswordResetRequestRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: QuizzCreationRoute.page),
        AutoRoute(page: QuizzDetailsRoute.page),
      ];
}
