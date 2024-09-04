import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_constants.dart';
import '../../quizz_details/domain/quiz_details_model.dart';
import '../data/repositories/dashboard_repository.dart';
import '../domain/quiz_dashboard_model.dart';
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
      totalItemsCount: 0,
      itemsFrom: 1,
      itemsTo: 0,
    );
    return const DashboardState.loading();
  }

  void initLoad() async {
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
          state = DashboardState.loaded(_quizList);
          _currentPage++;
        },
      );
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }

  void loadMore() async {
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
          state = DashboardState.loaded(_quizList);
          _currentPage++;
        },
      );
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }

  void deleteQuiz(String id) async {
    try {
      final result = await ref.read(dashboardRepositoryProvider).deleteQuiz(id);
      result.fold(
        (error) => state = DashboardState.error(error.message),
        (_) {
          final tempQuizes = List<QuizDashboardModel>.from(_quizList.items);
          tempQuizes.removeWhere((element) => element.id == id);
          state = DashboardState.loaded(
            _quizList.copyWith(items: tempQuizes, totalItemsCount: _quizList.totalItemsCount - 1),
          );
        },
      );
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }

  void notifyStatusChanged(String id, QuizStatus status, QuizAvailability availability) {
    final tempQuizes = List<QuizDashboardModel>.from(_quizList.items);
    final index = tempQuizes.indexWhere((element) => element.id == id);
    if (index != -1) {
      tempQuizes[index] = tempQuizes[index].copyWith(status: status, availability: availability);
      state = DashboardState.loaded(_quizList.copyWith(items: tempQuizes));
    }
  }
}
