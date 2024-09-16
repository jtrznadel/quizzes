import 'package:freezed_annotation/freezed_annotation.dart';

import '../../quizz_details/domain/quiz_details_model.dart';
import '../domain/user_answer_model.dart';

part 'quizz_take_state.freezed.dart';

@freezed
class QuizzTakeState with _$QuizzTakeState {
  const factory QuizzTakeState.initial() = _Initial;
  const factory QuizzTakeState.loading() = _Loading;
  const factory QuizzTakeState.loaded({
    required QuizDetailsModel quiz,
    required List<UserAnswerModel> userAnswers,
    required int currentStep,
  }) = _Loaded;
  const factory QuizzTakeState.error(String message) = _Error;
  const factory QuizzTakeState.finished() = _Finished;
}
