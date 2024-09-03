// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewPasswordPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [QuizzCreationPage]
class QuizzCreationRoute extends PageRouteInfo<void> {
  const QuizzCreationRoute({List<PageRouteInfo>? children})
      : super(
          QuizzCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizzCreationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizzCreationPage();
    },
  );
}

/// generated route for
/// [QuizzDetailsPage]
class QuizzDetailsRoute extends PageRouteInfo<void> {
  const QuizzDetailsRoute({List<PageRouteInfo>? children})
      : super(
          QuizzDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizzDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizzDetailsPage();
    },
  );
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInPage();
    },
  );
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [SuccessfulPasswordResetRequestPage]
class SuccessfulPasswordResetRequestRoute extends PageRouteInfo<void> {
  const SuccessfulPasswordResetRequestRoute({List<PageRouteInfo>? children})
      : super(
          SuccessfulPasswordResetRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessfulPasswordResetRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuccessfulPasswordResetRequestPage();
    },
  );
}

/// generated route for
/// [TakeQuizzPage]
class TakeQuizzRoute extends PageRouteInfo<TakeQuizzRouteArgs> {
  TakeQuizzRoute({
    Key? key,
    required TestQuizEntity quizEntity,
    List<PageRouteInfo>? children,
  }) : super(
          TakeQuizzRoute.name,
          args: TakeQuizzRouteArgs(
            key: key,
            quizEntity: quizEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'TakeQuizzRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TakeQuizzRouteArgs>();
      return TakeQuizzPage(
        key: args.key,
        quizEntity: args.quizEntity,
      );
    },
  );
}

class TakeQuizzRouteArgs {
  const TakeQuizzRouteArgs({
    this.key,
    required this.quizEntity,
  });

  final Key? key;

  final TestQuizEntity quizEntity;

  @override
  String toString() {
    return 'TakeQuizzRouteArgs{key: $key, quizEntity: $quizEntity}';
  }
}

/// generated route for
/// [TempPage]
class TempRoute extends PageRouteInfo<void> {
  const TempRoute({List<PageRouteInfo>? children})
      : super(
          TempRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TempPage();
    },
  );
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
