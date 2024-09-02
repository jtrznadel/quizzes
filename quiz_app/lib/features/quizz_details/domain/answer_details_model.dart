import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_details_model.freezed.dart';
part 'answer_details_model.g.dart';

@freezed
class AnswerDetailsModel with _$AnswerDetailsModel {
  const factory AnswerDetailsModel({
    required String id,
    required String content,
    required bool isCorrect,
  }) = _AnswerDetailsModel;

  factory AnswerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerDetailsModelFromJson(json);
}