// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizRequestModelImpl _$$QuizRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizRequestModelImpl(
      content: json['content'] as String,
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      questionTypes: (json['questionTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      attachments: const MultipartFileConverter()
          .fromJson(json['attachments'] as List<String>),
    );

Map<String, dynamic> _$$QuizRequestModelImplToJson(
        _$QuizRequestModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'numberOfQuestions': instance.numberOfQuestions,
      'questionTypes': instance.questionTypes,
      'attachments':
          const MultipartFileConverter().toJson(instance.attachments),
    };
