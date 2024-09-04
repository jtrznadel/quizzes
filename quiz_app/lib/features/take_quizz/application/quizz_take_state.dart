import 'package:freezed_annotation/freezed_annotation.dart';

part 'quizz_take_state.freezed.dart';

@freezed
class QuizzTakeState with _$QuizzTakeState {
  const factory QuizzTakeState.initial() = _Initial;
  const factory QuizzTakeState.loading() = _Loading;
  const factory QuizzTakeState.loaded({
    required int currentStep,
    required Map<String, String> answers,
  }) = _Loaded;
  const factory QuizzTakeState.error(String message) = _Error;
  const factory QuizzTakeState.finished() = _Finished;
}
