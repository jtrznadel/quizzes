import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_constants.dart';
import '../data/repositories/dashboard_repository.dart';
import '../domain/quiz_list_model.dart';
import 'dashboard_state.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  int _currentPage = 1;
  late QuizListModel _quizList;

  @override
  DashboardState build() {
    _quizList = const QuizListModel(
      items: [],
      totalPages: 0,
      totalItemCount: 0,
      itemsFrom: 1,
      itemsTo: 0,
    );
    return const DashboardState.loading();
  }

  void loadQuizzes() async {
    state = const DashboardState.loading();

    try {
      final result = await ref
          .read(dashboardRepositoryProvider)
          .getQuizList(_currentPage, ApiConstants.quizPageSize);
      result.fold(
        (error) => state = DashboardState.error(error.message),
        (quizList) {
          _quizList = quizList.copyWith(
            items: [..._quizList.items, ...quizList.items],
          );
          state = DashboardState.loaded(quizList);
          _currentPage++;
        },
      );
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }

  void deleteQuiz(String id) async {
    try {
      final result = await ref
          .read(dashboardRepositoryProvider)
          .deleteQuiz(id);
      result.fold(
        (error) => state = DashboardState.error(error.message),
        (_) => loadQuizzes(),
      );
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }
}
