import 'package:freezed_annotation/freezed_annotation.dart';

part 'take_quiz_result_answer_model.freezed.dart';
part 'take_quiz_result_answer_model.g.dart';

@freezed
class TakeQuizResultAnswerModel with _$TakeQuizResultAnswerModel {
  const factory TakeQuizResultAnswerModel({
    required String id,
    required String content,
    required bool isCorrect,
  }) = _TakeQuizResultAnswerModel;

  factory TakeQuizResultAnswerModel.fromJson(Map<String, dynamic> json) => _$TakeQuizResultAnswerModelFromJson(json);
}
