import 'package:freezed_annotation/freezed_annotation.dart';
import 'generate_question_model.dart';

part 'generate_quiz_model.g.dart';
part 'generate_quiz_model.freezed.dart';

@freezed
class GenerateQuizModel with _$GenerateQuizModel {
  const factory GenerateQuizModel({
    required String title,
    required String description,
    required List<GenerateQuestionModel> generateQuestions,
  }) = _GenerateQuizModel;

  factory GenerateQuizModel.fromJson(Map<String, dynamic> json) => _$GenerateQuizModelFromJson(json);
}
