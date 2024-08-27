import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/refresh_token_missing_exception.dart';
import '../data/repositories/user_repository.dart';
import '../domain/user.dart';
import 'user_state.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  UserState build() {
    getUser();
    return const UserState.initial();
  }

  Future<void> getUser() async {
    state = const UserState.loading();
    try {
      final user = await ref.read(userRepositoryProvider).getUser();
      user.fold(
        (error) => state = UserState.error(error),
        (user) => state = UserState.success(user),
      );
    } on RefreshTokenMissingException catch (e) {
      state = UserState.error(e);
    } on DioException catch (e) {
      state = UserState.error(e);
    }
  }

  Future<void> updateUser({required User user}) async {
    state = const UserState.loading();
    try{
      await ref.read(userRepositoryProvider).updateUser(user: user);
      await getUser();
    } catch(e) {
      state = UserState.success(user);
      rethrow;
    }
  }
}
