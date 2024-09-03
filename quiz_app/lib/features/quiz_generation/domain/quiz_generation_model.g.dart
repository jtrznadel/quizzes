// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_generation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizGenerationModelImpl _$$QuizGenerationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizGenerationModelImpl(
      content: json['content'] as String,
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      questionTypes: (json['questionTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$QuizGenerationModelImplToJson(
        _$QuizGenerationModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'numberOfQuestions': instance.numberOfQuestions,
      'questionTypes': instance.questionTypes,
    };
