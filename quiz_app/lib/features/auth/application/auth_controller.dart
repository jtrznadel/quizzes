import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/app_router.dart';
import '../../../core/services/session_provider.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/user_auth.dart';
import 'auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AuthState.loading();
    //TODO: Remove this delay after testing
    await Future.delayed(const Duration(seconds: 5));
    final userAuth = UserAuth(email: email, password: password);
    final result =
        await ref.read(authRepositoryProvider).signUp(userAuth: userAuth);
    result.fold(
      (error) => state = AuthState.error(error.message),
      (_) => state = const AuthState.success(),
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    final userAuth = UserAuth(email: email, password: password);
    state = const AuthState.loading();
    final result =
        await ref.read(authRepositoryProvider).signIn(userAuth: userAuth);
    print("result: $result");
    result.fold(
      (error) => state = AuthState.error(error.message),
      (tokens) {
        ref.read(sessionProvider).saveTokens(
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            );
        _routeDetails();
        state = const AuthState.success();
      },
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    final result = await ref.read(authRepositoryProvider).signOut();
    result.fold(
      (error) => state = AuthState.error(error.message),
      (_) {
        ref.read(sessionProvider).deleteTokens();
        state = const AuthState.success();
      },
    );
  }

  void _routeDetails() {
    AppRouter().replace(const DashboardRoute());
  }
}
