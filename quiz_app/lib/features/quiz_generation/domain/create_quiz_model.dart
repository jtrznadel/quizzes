import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_question_model.dart';
import 'generate_question_model.dart';

part 'create_quiz_model.g.dart';
part 'create_quiz_model.freezed.dart';

@freezed
class CreateQuizModel with _$CreateQuizModel {
  const factory CreateQuizModel({
    required String title,
    required String description,
    required List<CreateQuestionModel> createQuizQuestions,
  }) = _CreateQuizModel;

  factory CreateQuizModel.fromGenerateQuizModel({
    required String title,
    required String description,
    required List<GenerateQuestionModel> generateQuizQuestions,
  }) {
    return CreateQuizModel(
      title: title,
      description: description,
      createQuizQuestions: generateQuizQuestions
          .map((question) => CreateQuestionModel.fromGenerateQuestionModel(
                title: question.title,
                generateQuizAnswers: question.generateQuizAnswers,
              ))
          .toList(),
    );
  }

  factory CreateQuizModel.fromJson(Map<String, dynamic> json) => _$CreateQuizModelFromJson(json);
}
