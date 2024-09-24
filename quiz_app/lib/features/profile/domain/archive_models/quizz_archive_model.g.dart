// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz_archive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizzArchiveModelImpl _$$QuizzArchiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizzArchiveModelImpl(
      quizId: json['quizId'] as String,
      quizTitle: json['quizTitle'] as String,
      quizDescription: json['quizDescription'] as String,
      participtionDateUtc: json['participtionDateUtc'] as String,
      status: json['status'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) =>
              QuizzArchiveQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAnswers: (json['userAnswers'] as List<dynamic>)
          .map((e) =>
              QuizzArchiveUserAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizResult: QuizzArchiveQuizResultModel.fromJson(
          json['quizResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuizzArchiveModelImplToJson(
        _$QuizzArchiveModelImpl instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'quizTitle': instance.quizTitle,
      'quizDescription': instance.quizDescription,
      'participtionDateUtc': instance.participtionDateUtc,
      'status': instance.status,
      'questions': instance.questions,
      'userAnswers': instance.userAnswers,
      'quizResult': instance.quizResult,
    };
