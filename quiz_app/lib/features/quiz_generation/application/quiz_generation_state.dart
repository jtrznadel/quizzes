import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/quiz_model.dart';

part 'quiz_generation_state.freezed.dart';

@freezed
class QuizGenerationState with _$QuizGenerationState {
  const factory QuizGenerationState.generating() = _Generating;
  const factory QuizGenerationState.generated(QuizModel quiz) = _Generated;
  const factory QuizGenerationState.error(String message) = _Error;
}