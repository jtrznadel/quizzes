// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_participation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizParticipationModel _$QuizParticipationModelFromJson(
    Map<String, dynamic> json) {
  return _QuizParticipationModel.fromJson(json);
}

/// @nodoc
mixin _$QuizParticipationModel {
  String get quizParticipationId => throw _privateConstructorUsedError;
  List<String> get questionsId => throw _privateConstructorUsedError;
  List<String> get answersId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizParticipationModelCopyWith<QuizParticipationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizParticipationModelCopyWith<$Res> {
  factory $QuizParticipationModelCopyWith(QuizParticipationModel value,
          $Res Function(QuizParticipationModel) then) =
      _$QuizParticipationModelCopyWithImpl<$Res, QuizParticipationModel>;
  @useResult
  $Res call(
      {String quizParticipationId,
      List<String> questionsId,
      List<String> answersId});
}

/// @nodoc
class _$QuizParticipationModelCopyWithImpl<$Res,
        $Val extends QuizParticipationModel>
    implements $QuizParticipationModelCopyWith<$Res> {
  _$QuizParticipationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizParticipationId = null,
    Object? questionsId = null,
    Object? answersId = null,
  }) {
    return _then(_value.copyWith(
      quizParticipationId: null == quizParticipationId
          ? _value.quizParticipationId
          : quizParticipationId // ignore: cast_nullable_to_non_nullable
              as String,
      questionsId: null == questionsId
          ? _value.questionsId
          : questionsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answersId: null == answersId
          ? _value.answersId
          : answersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizParticipationModelImplCopyWith<$Res>
    implements $QuizParticipationModelCopyWith<$Res> {
  factory _$$QuizParticipationModelImplCopyWith(
          _$QuizParticipationModelImpl value,
          $Res Function(_$QuizParticipationModelImpl) then) =
      __$$QuizParticipationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quizParticipationId,
      List<String> questionsId,
      List<String> answersId});
}

/// @nodoc
class __$$QuizParticipationModelImplCopyWithImpl<$Res>
    extends _$QuizParticipationModelCopyWithImpl<$Res,
        _$QuizParticipationModelImpl>
    implements _$$QuizParticipationModelImplCopyWith<$Res> {
  __$$QuizParticipationModelImplCopyWithImpl(
      _$QuizParticipationModelImpl _value,
      $Res Function(_$QuizParticipationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizParticipationId = null,
    Object? questionsId = null,
    Object? answersId = null,
  }) {
    return _then(_$QuizParticipationModelImpl(
      quizParticipationId: null == quizParticipationId
          ? _value.quizParticipationId
          : quizParticipationId // ignore: cast_nullable_to_non_nullable
              as String,
      questionsId: null == questionsId
          ? _value._questionsId
          : questionsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answersId: null == answersId
          ? _value._answersId
          : answersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizParticipationModelImpl implements _QuizParticipationModel {
  const _$QuizParticipationModelImpl(
      {required this.quizParticipationId,
      required final List<String> questionsId,
      required final List<String> answersId})
      : _questionsId = questionsId,
        _answersId = answersId;

  factory _$QuizParticipationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizParticipationModelImplFromJson(json);

  @override
  final String quizParticipationId;
  final List<String> _questionsId;
  @override
  List<String> get questionsId {
    if (_questionsId is EqualUnmodifiableListView) return _questionsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionsId);
  }

  final List<String> _answersId;
  @override
  List<String> get answersId {
    if (_answersId is EqualUnmodifiableListView) return _answersId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answersId);
  }

  @override
  String toString() {
    return 'QuizParticipationModel(quizParticipationId: $quizParticipationId, questionsId: $questionsId, answersId: $answersId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizParticipationModelImpl &&
            (identical(other.quizParticipationId, quizParticipationId) ||
                other.quizParticipationId == quizParticipationId) &&
            const DeepCollectionEquality()
                .equals(other._questionsId, _questionsId) &&
            const DeepCollectionEquality()
                .equals(other._answersId, _answersId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizParticipationId,
      const DeepCollectionEquality().hash(_questionsId),
      const DeepCollectionEquality().hash(_answersId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizParticipationModelImplCopyWith<_$QuizParticipationModelImpl>
      get copyWith => __$$QuizParticipationModelImplCopyWithImpl<
          _$QuizParticipationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizParticipationModelImplToJson(
      this,
    );
  }
}

abstract class _QuizParticipationModel implements QuizParticipationModel {
  const factory _QuizParticipationModel(
      {required final String quizParticipationId,
      required final List<String> questionsId,
      required final List<String> answersId}) = _$QuizParticipationModelImpl;

  factory _QuizParticipationModel.fromJson(Map<String, dynamic> json) =
      _$QuizParticipationModelImpl.fromJson;

  @override
  String get quizParticipationId;
  @override
  List<String> get questionsId;
  @override
  List<String> get answersId;
  @override
  @JsonKey(ignore: true)
  _$$QuizParticipationModelImplCopyWith<_$QuizParticipationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
