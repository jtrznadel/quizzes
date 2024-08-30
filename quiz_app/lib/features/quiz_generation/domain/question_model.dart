import 'package:freezed_annotation/freezed_annotation.dart';
import 'answer_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String title,
    required List<AnswerModel> createAnswersDto,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}