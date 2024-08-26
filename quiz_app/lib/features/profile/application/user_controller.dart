import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
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
        (error) => state = UserState.error(error.message),
        (user) => state = UserState.success(user),
      );
    } catch (_) {
      state = UserState.error(S.current.profileSomethingWentWrong);
    }
  }

  Future<void> updateUser({required User user}) async {
    state = const UserState.loading();
    await ref.read(userRepositoryProvider).updateUser(user: user);
    await getUser();
  }
}
