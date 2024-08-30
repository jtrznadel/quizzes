import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_model.dart';

part 'quiz_model.g.dart';
part 'quiz_model.freezed.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String title,
    required String description,
    required List<QuestionModel> createQuestionsDto,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}