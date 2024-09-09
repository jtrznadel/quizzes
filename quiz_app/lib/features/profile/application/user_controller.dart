import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/user_repository.dart';
import '../domain/user.dart';
import 'user_state.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  UserState build() {
    return const UserState.loading();
  }

  Future<void> getUser() async {
    try {
      final user = await ref.read(userRepositoryProvider).getUser();
      user.fold(
        (error) => state = UserState.error(error),
        (user) => state = UserState.success(user),
      );
    } on Exception catch (e) {
      state = UserState.error(e);
    }
  }

  Future<void> updateUser({required User user}) async {
    state = UserState.success(user, isUsernameUpdating: true);
    try {
      await ref.read(userRepositoryProvider).updateUser(user: user);
      await getUser();
      state = UserState.success(user);
    } on Exception catch (e) {
      state = UserState.error(e);
    }
  }
}
