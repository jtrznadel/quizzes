import 'dart:core';

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
    final userAuth = UserAuth(email: email, password: password);
    final result = await ref.read(authRepositoryProvider).signUp(userAuth: userAuth);
    result.fold(
      (error) => state = AuthState.error(error.message),
      (_) => state = const AuthState.success(),
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    final userAuth = UserAuth(email: email, password: password);
    state = const AuthState.loading();
    final result = await ref.read(authRepositoryProvider).signIn(userAuth: userAuth);
    result.fold(
      (error) => state = AuthState.error(error.message),
      (tokens) async {
        await ref.read(sessionProvider).saveTokens(
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            );
        state = const AuthState.authenticated();
      },
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    final result = await ref.read(authRepositoryProvider).signOut();
    result.fold(
      (error) => state = AuthState.error(error.message),
      (_) async {
        await ref.read(sessionProvider).deleteTokens();
        state = const AuthState.unauthenticated();
      },
    );
  }
}
