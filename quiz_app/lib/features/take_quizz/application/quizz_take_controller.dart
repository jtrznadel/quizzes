import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/take_quiz_repository.dart';
import '../domain/quiz_participation_model.dart';
import '../domain/user_answer_model.dart';
import 'quizz_take_state.dart';

part 'quizz_take_controller.g.dart';

@riverpod
class QuizzTakeController extends _$QuizzTakeController {
  final takeQuizProvider = takeQuizRepositoryProvider;

  @override
  QuizzTakeState build() {
    return const QuizzTakeState.initial();
    //TODO: Remove when the real implementation is done and UI handle it
  }

  Future<void> startQuizz({required String id}) async {
    state = const QuizzTakeState.loading();
    final result = await ref.read(takeQuizProvider).getQuizByInvitation(id: id);
    result.fold(
      (error) => state = QuizzTakeState.error(error.message),
      (quizz) => state = QuizzTakeState.loaded(
        quiz: quizz,
        userAnswers: [],
        currentStep: 1,
      ),
    );
  }

  void nextStep() {
    state.maybeWhen(
      loaded: (quiz, userAnswers, currentStep) => state = QuizzTakeState.loaded(
        quiz: quiz,
        userAnswers: userAnswers,
        currentStep: currentStep + 1,
      ),
      orElse: () {},
    );
  }

  void previousStep() {
    state.maybeWhen(
      loaded: (quiz, userAnswers, currentStep) => state = QuizzTakeState.loaded(
        quiz: quiz,
        userAnswers: userAnswers,
        currentStep: currentStep - 1,
      ),
      orElse: () {},
    );
  }

  void answerQuestion({required String questionId, required String answerId}) {
    state.maybeWhen(
      loaded: (quiz, userAnswers, currentStep) {
        final updatedAnswers = List<UserAnswerModel>.from(userAnswers);
        final existingAnswerIndex = updatedAnswers.indexWhere((element) => element.questionId == questionId);

        if (existingAnswerIndex != -1) {
          updatedAnswers[existingAnswerIndex] = updatedAnswers[existingAnswerIndex].copyWith(answerId: answerId);
        } else {
          updatedAnswers.add(UserAnswerModel(questionId: questionId, answerId: answerId));
        }

        state = QuizzTakeState.loaded(
          quiz: quiz,
          userAnswers: updatedAnswers,
          currentStep: currentStep,
        );
      },
      orElse: () {},
    );
  }

  Future<void> finishQuizz({required QuizParticipationModel participationModel}) async {
    state = const QuizzTakeState.loading();
    final result = await ref.read(takeQuizProvider).submitQuiz(participationModel: participationModel);
    result.fold(
      (error) => state = QuizzTakeState.error(error.message),
      (_) => state = const QuizzTakeState.finished(),
    );
    Future.delayed(const Duration(seconds: 2), () {
      state = const QuizzTakeState.finished();
    });
  }
}
