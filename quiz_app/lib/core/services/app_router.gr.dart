// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BasicErrorPage]
class BasicErrorRoute extends PageRouteInfo<BasicErrorRouteArgs> {
  BasicErrorRoute({
    Key? key,
    required VoidCallback onRefresh,
    required String refreshButtonText,
    required String imageAsset,
    required String errorText,
    List<PageRouteInfo>? children,
  }) : super(
          BasicErrorRoute.name,
          args: BasicErrorRouteArgs(
            key: key,
            onRefresh: onRefresh,
            refreshButtonText: refreshButtonText,
            imageAsset: imageAsset,
            errorText: errorText,
          ),
          initialChildren: children,
        );

  static const String name = 'BasicErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BasicErrorRouteArgs>();
      return BasicErrorPage(
        key: args.key,
        onRefresh: args.onRefresh,
        refreshButtonText: args.refreshButtonText,
        imageAsset: args.imageAsset,
        errorText: args.errorText,
      );
    },
  );
}

class BasicErrorRouteArgs {
  const BasicErrorRouteArgs({
    this.key,
    required this.onRefresh,
    required this.refreshButtonText,
    required this.imageAsset,
    required this.errorText,
  });

  final Key? key;

  final VoidCallback onRefresh;

  final String refreshButtonText;

  final String imageAsset;

  final String errorText;

  @override
  String toString() {
    return 'BasicErrorRouteArgs{key: $key, onRefresh: $onRefresh, refreshButtonText: $refreshButtonText, imageAsset: $imageAsset, errorText: $errorText}';
  }
}

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
class QuizzDetailsRoute extends PageRouteInfo<QuizzDetailsRouteArgs> {
  QuizzDetailsRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          QuizzDetailsRoute.name,
          args: QuizzDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizzDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizzDetailsRouteArgs>();
      return QuizzDetailsPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class QuizzDetailsRouteArgs {
  const QuizzDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'QuizzDetailsRouteArgs{key: $key, id: $id}';
  }
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
