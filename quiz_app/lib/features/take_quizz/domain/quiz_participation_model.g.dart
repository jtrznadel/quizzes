// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_participation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizParticipationModelImpl _$$QuizParticipationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizParticipationModelImpl(
      quizParticipationId: json['quizParticipationId'] as String,
      questionsId: (json['questionsId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answersId:
          (json['answersId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QuizParticipationModelImplToJson(
        _$QuizParticipationModelImpl instance) =>
    <String, dynamic>{
      'quizParticipationId': instance.quizParticipationId,
      'questionsId': instance.questionsId,
      'answersId': instance.answersId,
    };
