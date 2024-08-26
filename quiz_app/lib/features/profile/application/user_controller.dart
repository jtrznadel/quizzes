import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/user_repository.dart';
import '../domain/user.dart';
import 'user_state.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  UserState build() {
    return const UserState.initial();
  }

  Future<void> getUser() async {
    state = const UserState.loading();
    final user = await ref.read(userRepositoryProvider).getUser();
    user.fold(
      (error) => state = UserState.error(error.message),
      (user) => state = UserState.success(user),
    );
  }

  Future<void> updateUser({required User user}) async {
    state = const UserState.loading();
    await ref.read(userRepositoryProvider).updateUser(user: user);
    await getUser();
  }
}