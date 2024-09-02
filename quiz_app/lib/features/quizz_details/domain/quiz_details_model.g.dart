// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizDetailsModelImpl _$$QuizDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizDetailsModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      availability: json['availability'] as String,
      status: json['status'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizDetailsModelImplToJson(
        _$QuizDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'availability': instance.availability,
      'status': instance.status,
      'questions': instance.questions,
    };
