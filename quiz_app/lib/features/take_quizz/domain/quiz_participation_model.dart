import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_participation_model.freezed.dart';
part 'quiz_participation_model.g.dart';

@freezed
class QuizParticipationModel with _$QuizParticipationModel {
  const factory QuizParticipationModel({
    required String quizParticipationId,
    required List<String> questionsId,
    required List<String> answersId,
  }) = _QuizParticipationModel;

  factory QuizParticipationModel.fromJson(Map<String, dynamic> json) => _$QuizParticipationModelFromJson(json);
}
