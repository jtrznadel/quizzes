import 'package:freezed_annotation/freezed_annotation.dart';

import '../../quizz_details/domain/quiz_details_model.dart';
import 'user_answer_model.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

@freezed
class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    required String quizParticipationId,
    required QuizDetailsModel quizDetails,
    required List<UserAnswerModel> userAnswers,
    required int totalQuestions,
    required int correctAnswers,
    required double scorePercentage,
  }) = _QuizResultModel;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) => _$QuizResultModelFromJson(json);
}
