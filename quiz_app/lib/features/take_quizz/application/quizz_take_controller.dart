import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/enums/quizz_score_enum.dart';
import '../presentation/views/take_quizz_summary_page.dart';
import 'quizz_take_state.dart';

part 'quizz_take_controller.g.dart';

@riverpod
class QuizzTakeController extends _$QuizzTakeController {
  @override
  QuizzTakeState build() {
    //return const QuizzTakeState.initial();
    //TODO: Remove when the real implementation is done and UI handle it
    return const QuizzTakeState.loaded(currentStep: 1, answers: {});
  }

  Future<void> startQuizz({required String id}) async {
    state = const QuizzTakeState.loading();
    // final result = await ref.read(quizzRepositoryProvider).getQuizz(id: id);
    // result.fold(
    //   (error) => state = QuizzTakeState.error(error.message),
    //   (quizz) => state = const QuizzTakeState.loaded(
    //     currentStep: 0,
    //     answers: {},
    //   ),
    // );
    Future.delayed(const Duration(seconds: 2), () {
      state = const QuizzTakeState.loaded(currentStep: 1, answers: {});
    });
  }

  void nextStep() {
    state.maybeWhen(
      loaded: (currentStep, answers) => state = QuizzTakeState.loaded(currentStep: currentStep + 1, answers: answers),
      orElse: () {},
    );
  }

  void previousStep() {
    state.maybeWhen(
      loaded: (currentStep, answers) => state = QuizzTakeState.loaded(currentStep: currentStep - 1, answers: answers),
      orElse: () {},
    );
  }

  void answerQuestion({required String questionId, required String answer}) {
    state.maybeWhen(
      loaded: (currentStep, answers) {
        final updatedAnswers = Map<String, String>.from(answers)..[questionId] = answer;
        state = QuizzTakeState.loaded(
          currentStep: currentStep,
          answers: updatedAnswers,
        );
      },
      orElse: () {},
    );
  }

  Future<void> finishQuizz({required String id}) async {
    state = const QuizzTakeState.loading();
    // final result = await ref.read(quizzRepositoryProvider).finishQuizz(id: id);
    // result.fold(
    //   (error) => state = QuizzTakeState.error(error.message),
    //   () => state = const QuizzTakeState.finished(),
    // );
    Future.delayed(const Duration(seconds: 2), () {
      state = const QuizzTakeState.finished();
    });
  }
}
