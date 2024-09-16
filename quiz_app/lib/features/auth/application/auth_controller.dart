import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/session_provider.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/user_auth.dart';
import 'auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  final _authRepostiory = authRepositoryProvider;

  @override
  AuthState build() {
    return const AuthState.unauthenticated(true);
  }

  Future<bool> signUp({required String email, required String password}) async {
    final obscurePassword = state.maybeWhen(
      unauthenticated: (obscurePassword) => obscurePassword,
      orElse: () => true,
    );
    state = AuthState.loading(obscurePassword);
    final userAuth = UserAuth(email: email, password: password);
    final result = await ref.read(_authRepostiory).signUp(userAuth: userAuth);
    return result.fold((error) {
      state = AuthState.unauthenticated(obscurePassword);
      return false;
    }, (_) {
      state = AuthState.unauthenticated(obscurePassword);
      return true;
    });
  }

  Future<bool> signIn({required String email, required String password}) async {
    final userAuth = UserAuth(email: email, password: password);
    final obscurePassword = state.maybeWhen(
      unauthenticated: (obscurePassword) => obscurePassword,
      orElse: () => true,
    );
    state = AuthState.loading(obscurePassword);
    final result = await ref.read(_authRepostiory).signIn(userAuth: userAuth);
    return result.fold(
      (error) {
        state = AuthState.unauthenticated(obscurePassword);
        return false;
      },
      (tokens) async {
        await ref.read(sessionProvider).saveTokens(
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            );
        return true;
      },
    );
  }

  void togglePasswordVisibility() {
    state.maybeWhen(
      unauthenticated: (obscurePassword) {
        state = AuthState.unauthenticated(!obscurePassword);
      },
      orElse: () {},
    );
  }
}
