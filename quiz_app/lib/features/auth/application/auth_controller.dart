import 'package:quiz_app/features/auth/application/auth_state.dart';
import 'package:quiz_app/features/auth/data/repositories/auth_repository.dart';
import 'package:quiz_app/features/auth/domain/user_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signUp({required String username, required String email, required String password}) async {
    state = const AuthState.loading();
    //TODO: Remove this delay after testing
    await Future.delayed(const Duration(seconds: 5));
    final userAuth = UserAuth(email: email, password: password);
    final result = await ref.read(authRepositoryProvider).signUp(userAuth: userAuth);
    result.fold(
      (error) => state = AuthState.error(error.message),
      (_) => state = const AuthState.success(),
    );
  }
}
