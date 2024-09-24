import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_request_model.freezed.dart';

@freezed
class QuizRequestModel with _$QuizRequestModel {
  const factory QuizRequestModel({
    required String content,
    required int numberOfQuestions,
    required List<String> questionTypes,
    required List<PlatformFile> attachments,
    required String language,
  }) = _QuizRequestModel;
}

