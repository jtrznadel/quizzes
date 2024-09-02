import 'package:freezed_annotation/freezed_annotation.dart';

import 'question_details_model.dart';

part 'quiz_details_model.g.dart';
part 'quiz_details_model.freezed.dart';

// ignore: constant_identifier_names
enum QuizAvailability { Public, Private }

// ignore: constant_identifier_names
enum QuizStatus { Active, Inactive }

@freezed
class QuizDetailsModel with _$QuizDetailsModel {
  const factory QuizDetailsModel({
    required String id,
    required String title,
    required String description,
    required QuizAvailability availability,
    required QuizStatus status,
    required List<QuestionDetailsModel> questions,
  }) = _QuizDetailsModel;

  factory QuizDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$QuizDetailsModelFromJson(json);
}
