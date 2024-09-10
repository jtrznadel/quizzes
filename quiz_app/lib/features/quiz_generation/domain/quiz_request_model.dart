import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_request_model.freezed.dart';
part 'quiz_request_model.g.dart';

@freezed
class QuizRequestModel with _$QuizRequestModel {
  const factory QuizRequestModel({
    required String content,
    required int numberOfQuestions,
    required List<String> questionTypes,
    @MultipartFileConverter() required List<MultipartFile> attachments,
  }) = _QuizRequestModel;

  factory QuizRequestModel.fromJson(Map<String, dynamic> json) => _$QuizRequestModelFromJson(json);
}

class MultipartFileConverter implements JsonConverter<List<MultipartFile>, List<String>> {
  const MultipartFileConverter();

  @override
  List<MultipartFile> fromJson(List<String> json) {
    return json.map((path) => MultipartFile.fromFileSync(path)).toList();
  }

  @override
  List<String> toJson(List<MultipartFile> object) {
    return object.map((file) => file.filename!).toList();
  }
}
