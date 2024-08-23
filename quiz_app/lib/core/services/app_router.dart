import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/views/welcome_page.dart';
import '../../temp.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TempRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
      ];
}
