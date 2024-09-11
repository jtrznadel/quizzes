import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_constants.dart';
import '../../../generated/l10n.dart';
import '../../quizz_details/domain/quiz_details_model.dart';
import '../data/repositories/dashboard_repository.dart';
import '../domain/quiz_dashboard_model.dart';
import 'dashboard_state.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  late DashboardRepository _dashboardRepository;

  @override
  DashboardState build() {
    _dashboardRepository = ref.read(dashboardRepositoryProvider);
    return const DashboardState.loading();
  }

  void initLoad() async {
    state = const DashboardState.loading();

    try {
      final result =
          await _dashboardRepository.getQuizList(1, ApiConstants.quizPageSize);
      result.fold(
        (error) => state = DashboardState.error(error.message),
        (quizList) {
          state = DashboardState.loaded(quizList, 2);
        },
      );
    } catch (e) {
      state = DashboardState.error(S.current.somethingWentWrong);
    }
  }

  void loadMore() async {
    try {
      state.maybeWhen(
        loaded: (quizListModel, currentPage) async {
          final result = await _dashboardRepository.getQuizList(
            currentPage,
            ApiConstants.quizPageSize,
          );
          result.fold(
            (error) => state = DashboardState.error(error.message),
            (quizList) {
              state = DashboardState.loaded(
                quizListModel.copyWith(
                  items: [...quizListModel.items, ...quizList.items],
                  totalItemsCount: quizList.totalItemsCount,
                ),
                currentPage + 1,
              );
            },
          );
        },
        orElse: () {},
      );
    } catch (e) {
      state = DashboardState.error(S.current.somethingWentWrong);
    }
  }

  void deleteQuiz(String id) async {
    try {
      state.maybeWhen(
        loaded: (quizList, currentPage) async {
          final result = await _dashboardRepository.deleteQuiz(id);
          result.fold(
            (error) => state = DashboardState.error(error.message),
            (_) {
              final tempQuizes = List<QuizDashboardModel>.from(quizList.items);
              tempQuizes.removeWhere((element) => element.id == id);
              state = DashboardState.loaded(
                quizList.copyWith(
                  items: tempQuizes,
                  totalItemsCount: quizList.totalItemsCount - 1,
                ),
                currentPage,
              );
            },
          );
        },
        orElse: () {},
      );
    } catch (e) {
      state = DashboardState.error(S.current.somethingWentWrong);
    }
  }

  void reloadItem(QuizDetailsModel quiz){
    final quizDashboardModel = QuizDashboardModel.fromQuizDetailsModel(quiz);
    state.maybeWhen(
      loaded: (quizList, currentPage) {
        final tempQuizes = List<QuizDashboardModel>.from(quizList.items);
        final index = tempQuizes.indexWhere((element) => element.id == quiz.id);
        if (index != -1) {
          tempQuizes[index] = quizDashboardModel;
          state = DashboardState.loaded(
            quizList.copyWith(items: tempQuizes),
            currentPage,
          );
        }
      },
      orElse: () {},
    );
  }

}
