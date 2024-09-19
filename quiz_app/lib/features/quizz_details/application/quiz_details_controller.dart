import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
import '../data/repositories/quiz_details_repository.dart';
import '../domain/new_question_model.dart';
import '../domain/question_details_model.dart';
import '../domain/quiz_details_model.dart';
import '../domain/update_question_model.dart';
import 'quiz_details_state.dart';

part 'quiz_details_controller.g.dart';

@riverpod
class QuizDetailsController extends _$QuizDetailsController {
  final _quizDetailsRepository = quizDetailsRepositoryProvider;

  @override
  QuizDetailsState build() => const QuizDetailsState.loading();

  Future<void> getQuizDetails(String id) async {
    state = const QuizDetailsState.loading();

    try {
      final quizDetails =
          await ref.read(_quizDetailsRepository).getQuizDetails(id);
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
    try {
      await ref.read(_quizDetailsRepository).updateQuizStatus(
            id,
            status,
          );
      await ref.read(_quizDetailsRepository).updateQuizAvailability(
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
    try {
      await ref
          .read(_quizDetailsRepository)
          .updateQuizDetails(id, title, description);
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
    try {
      await ref.read(_quizDetailsRepository).deleteQuestion(id);
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

  Future<bool> addNewQuestion(NewQuestionModel question) async {
    try {
      await ref.read(_quizDetailsRepository).addQuestion(question);
      _reloadQuestionsAfterAdding();
      return true;
    } catch (e) {
      state = QuizDetailsState.error(S.current.somethingWentWrong);
      return false;
    }
  }

  //TODO: Use this method once it's possible to add answers to questions in the API
  Future<bool> _updateQuestion(UpdateQuestionModel question) async {
    try {
      state = const QuizDetailsState.loading();
      await ref.read(_quizDetailsRepository).updateQuestion(question);
      getQuizDetails(question.quizID);
      return true;
    } catch (e) {
      state = QuizDetailsState.error(S.current.somethingWentWrong);
      return false;
    }
  }

  Future<bool> updateQuestion(NewQuestionModel question, String questionId,) async {
    try {
      await ref.read(_quizDetailsRepository).deleteQuestion(questionId);
      await ref.read(_quizDetailsRepository).addQuestion(NewQuestionModel(
            title: question.title,
            createAnswers: question.answers,
            quizID: question.quizID,
          ));
      _reloadQuestionsAfterUpdating(questionId);
      return true;
    } catch (e) {
      state = QuizDetailsState.error(S.current.somethingWentWrong);
      return false;
    }
  }

  Future<void> _reloadQuestionsAfterUpdating(String oldQuestionId) async {
    try {
      state.maybeWhen(
        loaded: (quizDetails, answersVisible) async {
          final listWithoutOldQuestion = quizDetails.questions
              .where((q) => q.id != oldQuestionId)
              .toList();
          final updatedQuizDetails = await ref
              .read(_quizDetailsRepository)
              .getQuizDetails(quizDetails.id);
          final newQuestion = _findNewQuestion(
            listWithoutOldQuestion,
            updatedQuizDetails.questions,
          );

          final newQuestionList = quizDetails.questions
              .map((q) => q.id == oldQuestionId ? newQuestion : q)
              .toList();

          state = QuizDetailsState.loaded(quizDetails.copyWith(questions: newQuestionList), answersVisible);
        },
        orElse: () => state,
      );
    } catch (e) {
      state = QuizDetailsState.error(S.current.somethingWentWrong);
    }
  }

  Future<void> _reloadQuestionsAfterAdding() async {
    try {
      state.maybeWhen(
        loaded: (quizDetails, answersVisible) async {
          final updatedQuizDetails = await ref
              .read(_quizDetailsRepository)
              .getQuizDetails(quizDetails.id);
          final newQuestion = _findNewQuestion(
              quizDetails.questions, updatedQuizDetails.questions);
          final newQuestionList = quizDetails.questions + [newQuestion];
          state = QuizDetailsState.loaded(
              quizDetails.copyWith(questions: newQuestionList), answersVisible);
        },
        orElse: () => state,
      );
    } catch (e) {
      state = QuizDetailsState.error(S.current.somethingWentWrong);
    }
  }
}

QuestionDetailsModel _findNewQuestion(List<QuestionDetailsModel> oldQuestions,
    List<QuestionDetailsModel> newQuestions) {
  return newQuestions.firstWhere(
    (element) => !oldQuestions.any((q) => q.id == element.id),
  );
}
