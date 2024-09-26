import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/user_repository.dart';
import 'archive_state.dart';

part 'archive_controller.g.dart';

@riverpod
class ArchiveController extends _$ArchiveController {
  final _userRepository = userRepositoryProvider;

  @override
  ArchiveState build() {
    return const ArchiveState.loading();
  }

  Future<void> getQuizzArchive() async {
    try {
      final quizzArchive = await ref.read(_userRepository).getQuizzArchive();
      quizzArchive.fold(
        (error) => state = ArchiveState.error(error),
        (quizzArchive) {
          final fileredArchivedModel = quizzArchive.where((element) => element.status == 'Finished').toList();
          state = ArchiveState.success(fileredArchivedModel);
        },
      );
    } on Exception catch (e) {
      state = ArchiveState.error(e);
    }
  }
}
