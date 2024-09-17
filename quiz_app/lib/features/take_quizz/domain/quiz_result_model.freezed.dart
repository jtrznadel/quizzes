// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizResultModel _$QuizResultModelFromJson(Map<String, dynamic> json) {
  return _QuizResultModel.fromJson(json);
}

/// @nodoc
mixin _$QuizResultModel {
  String get quizParticipationId => throw _privateConstructorUsedError;
  QuizDetailsModel get quizDetails => throw _privateConstructorUsedError;
  List<UserAnswerModel> get userAnswers => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  double get scorePercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResultModelCopyWith<QuizResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultModelCopyWith<$Res> {
  factory $QuizResultModelCopyWith(
          QuizResultModel value, $Res Function(QuizResultModel) then) =
      _$QuizResultModelCopyWithImpl<$Res, QuizResultModel>;
  @useResult
  $Res call(
      {String quizParticipationId,
      QuizDetailsModel quizDetails,
      List<UserAnswerModel> userAnswers,
      int totalQuestions,
      int correctAnswers,
      double scorePercentage});

  $QuizDetailsModelCopyWith<$Res> get quizDetails;
}

/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res, $Val extends QuizResultModel>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizParticipationId = null,
    Object? quizDetails = null,
    Object? userAnswers = null,
    Object? totalQuestions = null,
    Object? correctAnswers = null,
    Object? scorePercentage = null,
  }) {
    return _then(_value.copyWith(
      quizParticipationId: null == quizParticipationId
          ? _value.quizParticipationId
          : quizParticipationId // ignore: cast_nullable_to_non_nullable
              as String,
      quizDetails: null == quizDetails
          ? _value.quizDetails
          : quizDetails // ignore: cast_nullable_to_non_nullable
              as QuizDetailsModel,
      userAnswers: null == userAnswers
          ? _value.userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as List<UserAnswerModel>,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      scorePercentage: null == scorePercentage
          ? _value.scorePercentage
          : scorePercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizDetailsModelCopyWith<$Res> get quizDetails {
    return $QuizDetailsModelCopyWith<$Res>(_value.quizDetails, (value) {
      return _then(_value.copyWith(quizDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizResultModelImplCopyWith<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  factory _$$QuizResultModelImplCopyWith(_$QuizResultModelImpl value,
          $Res Function(_$QuizResultModelImpl) then) =
      __$$QuizResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quizParticipationId,
      QuizDetailsModel quizDetails,
      List<UserAnswerModel> userAnswers,
      int totalQuestions,
      int correctAnswers,
      double scorePercentage});

  @override
  $QuizDetailsModelCopyWith<$Res> get quizDetails;
}

/// @nodoc
class __$$QuizResultModelImplCopyWithImpl<$Res>
    extends _$QuizResultModelCopyWithImpl<$Res, _$QuizResultModelImpl>
    implements _$$QuizResultModelImplCopyWith<$Res> {
  __$$QuizResultModelImplCopyWithImpl(
      _$QuizResultModelImpl _value, $Res Function(_$QuizResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizParticipationId = null,
    Object? quizDetails = null,
    Object? userAnswers = null,
    Object? totalQuestions = null,
    Object? correctAnswers = null,
    Object? scorePercentage = null,
  }) {
    return _then(_$QuizResultModelImpl(
      quizParticipationId: null == quizParticipationId
          ? _value.quizParticipationId
          : quizParticipationId // ignore: cast_nullable_to_non_nullable
              as String,
      quizDetails: null == quizDetails
          ? _value.quizDetails
          : quizDetails // ignore: cast_nullable_to_non_nullable
              as QuizDetailsModel,
      userAnswers: null == userAnswers
          ? _value._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as List<UserAnswerModel>,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      scorePercentage: null == scorePercentage
          ? _value.scorePercentage
          : scorePercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultModelImpl implements _QuizResultModel {
  const _$QuizResultModelImpl(
      {required this.quizParticipationId,
      required this.quizDetails,
      required final List<UserAnswerModel> userAnswers,
      required this.totalQuestions,
      required this.correctAnswers,
      required this.scorePercentage})
      : _userAnswers = userAnswers;

  factory _$QuizResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultModelImplFromJson(json);

  @override
  final String quizParticipationId;
  @override
  final QuizDetailsModel quizDetails;
  final List<UserAnswerModel> _userAnswers;
  @override
  List<UserAnswerModel> get userAnswers {
    if (_userAnswers is EqualUnmodifiableListView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswers);
  }

  @override
  final int totalQuestions;
  @override
  final int correctAnswers;
  @override
  final double scorePercentage;

  @override
  String toString() {
    return 'QuizResultModel(quizParticipationId: $quizParticipationId, quizDetails: $quizDetails, userAnswers: $userAnswers, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, scorePercentage: $scorePercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultModelImpl &&
            (identical(other.quizParticipationId, quizParticipationId) ||
                other.quizParticipationId == quizParticipationId) &&
            (identical(other.quizDetails, quizDetails) ||
                other.quizDetails == quizDetails) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.scorePercentage, scorePercentage) ||
                other.scorePercentage == scorePercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizParticipationId,
      quizDetails,
      const DeepCollectionEquality().hash(_userAnswers),
      totalQuestions,
      correctAnswers,
      scorePercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      __$$QuizResultModelImplCopyWithImpl<_$QuizResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultModelImplToJson(
      this,
    );
  }
}

abstract class _QuizResultModel implements QuizResultModel {
  const factory _QuizResultModel(
      {required final String quizParticipationId,
      required final QuizDetailsModel quizDetails,
      required final List<UserAnswerModel> userAnswers,
      required final int totalQuestions,
      required final int correctAnswers,
      required final double scorePercentage}) = _$QuizResultModelImpl;

  factory _QuizResultModel.fromJson(Map<String, dynamic> json) =
      _$QuizResultModelImpl.fromJson;

  @override
  String get quizParticipationId;
  @override
  QuizDetailsModel get quizDetails;
  @override
  List<UserAnswerModel> get userAnswers;
  @override
  int get totalQuestions;
  @override
  int get correctAnswers;
  @override
  double get scorePercentage;
  @override
  @JsonKey(ignore: true)
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
