import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
import '../data/repositories/quiz_details_repository.dart';
import '../domain/quiz_details_model.dart';
import 'quiz_details_state.dart';

part 'quiz_details_controller.g.dart';

@riverpod
class QuizDetailsController extends _$QuizDetailsController {
  @override
  QuizDetailsState build() => const QuizDetailsState.loading();

  Future<void> getQuizDetails(String id) async {
    state = const QuizDetailsState.loading();

    final QuizDetailsRepository quizDetailsRepository =
        ref.read(quizDetailsRepositoryProvider);

    try {
      final quizDetails = await quizDetailsRepository.getQuizDetails(id);
      state = QuizDetailsState.loaded(quizDetails, false);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }

  void changeAnswerVisibility(bool isVisible) {
    state = state.maybeWhen(
        loaded: (quizDetails, _) =>
            state = QuizDetailsState.loaded(quizDetails, isVisible),
        orElse: () => state);
  }

  void changeQuizStatus(QuizStatus status) {
    state = state.maybeWhen(
        loaded: (quizDetails, answersVisible) => QuizDetailsState.loaded(
            quizDetails.copyWith(status: status), answersVisible),
        orElse: () => state);
  }

  void changeQuizAvailability(QuizAvailability availability) {
    state = state.maybeWhen(
        loaded: (quizDetails, answersVisible) => QuizDetailsState.loaded(
            quizDetails.copyWith(availability: availability), answersVisible),
        orElse: () => state);
  }

  Future<bool> updateQuizProperties(
    String id,
    QuizStatus status,
    QuizAvailability availability,
  ) async {
    final QuizDetailsRepository quizDetailsRepository =
        ref.read(quizDetailsRepositoryProvider);
    try {
      await quizDetailsRepository.updateQuizStatus(
        id,
        status,
      );
      await quizDetailsRepository.updateQuizAvailability(
        id,
        availability,
      );
      return true;
    } catch (e) {
      kDebugMode ? debugPrint(e.toString()) : null;
      return false;
    }
  }

  Future<bool> updateQuizDetails(
    String id,
    String title,
    String description,
  ) async {
    final QuizDetailsRepository quizDetailsRepository =
        ref.read(quizDetailsRepositoryProvider);

    try {
      await quizDetailsRepository.updateQuizDetails(id, title, description);
      state.maybeWhen(loaded: (quizDetails, answersVisible) {
        state = QuizDetailsState.loaded(
            quizDetails.copyWith(title: title, description: description),
            answersVisible);
      }, orElse: () {
        state = QuizDetailsState.error(S.current.somethingWentWrong);
      });
      return true;
    } catch (e) {
      kDebugMode ? debugPrint(e.toString()) : null;
    }
    return false;
  }

  Future<bool> deleteQuestion(String id) async {
    final QuizDetailsRepository quizDetailsRepository =
        ref.read(quizDetailsRepositoryProvider);

    try {
      await quizDetailsRepository.deleteQuestion(id);
      state.maybeWhen(loaded: (quizDetails, answersVisible) {
        state = QuizDetailsState.loaded(
          quizDetails.copyWith(
            questions: quizDetails.questions.where((q) => q.id != id).toList(),
          ),
          answersVisible,
        );
      }, orElse: () {
        state = QuizDetailsState.error(S.current.somethingWentWrong);
      });
      return true;
    } catch (e) {
      kDebugMode ? debugPrint(e.toString()) : null;
      return false;
    }
  }
}
