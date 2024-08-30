// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_generation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizGenerationModel _$QuizGenerationModelFromJson(Map<String, dynamic> json) {
  return _QuizGenerationModel.fromJson(json);
}

/// @nodoc
mixin _$QuizGenerationModel {
  String get content => throw _privateConstructorUsedError;
  int get numberOfQuestions => throw _privateConstructorUsedError;
  int get typeOfQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizGenerationModelCopyWith<QuizGenerationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizGenerationModelCopyWith<$Res> {
  factory $QuizGenerationModelCopyWith(
          QuizGenerationModel value, $Res Function(QuizGenerationModel) then) =
      _$QuizGenerationModelCopyWithImpl<$Res, QuizGenerationModel>;
  @useResult
  $Res call({String content, int numberOfQuestions, int typeOfQuestions});
}

/// @nodoc
class _$QuizGenerationModelCopyWithImpl<$Res, $Val extends QuizGenerationModel>
    implements $QuizGenerationModelCopyWith<$Res> {
  _$QuizGenerationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? numberOfQuestions = null,
    Object? typeOfQuestions = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfQuestions: null == numberOfQuestions
          ? _value.numberOfQuestions
          : numberOfQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      typeOfQuestions: null == typeOfQuestions
          ? _value.typeOfQuestions
          : typeOfQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizGenerationModelImplCopyWith<$Res>
    implements $QuizGenerationModelCopyWith<$Res> {
  factory _$$QuizGenerationModelImplCopyWith(_$QuizGenerationModelImpl value,
          $Res Function(_$QuizGenerationModelImpl) then) =
      __$$QuizGenerationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, int numberOfQuestions, int typeOfQuestions});
}

/// @nodoc
class __$$QuizGenerationModelImplCopyWithImpl<$Res>
    extends _$QuizGenerationModelCopyWithImpl<$Res, _$QuizGenerationModelImpl>
    implements _$$QuizGenerationModelImplCopyWith<$Res> {
  __$$QuizGenerationModelImplCopyWithImpl(_$QuizGenerationModelImpl _value,
      $Res Function(_$QuizGenerationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? numberOfQuestions = null,
    Object? typeOfQuestions = null,
  }) {
    return _then(_$QuizGenerationModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfQuestions: null == numberOfQuestions
          ? _value.numberOfQuestions
          : numberOfQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      typeOfQuestions: null == typeOfQuestions
          ? _value.typeOfQuestions
          : typeOfQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizGenerationModelImpl implements _QuizGenerationModel {
  const _$QuizGenerationModelImpl(
      {required this.content,
      required this.numberOfQuestions,
      required this.typeOfQuestions});

  factory _$QuizGenerationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizGenerationModelImplFromJson(json);

  @override
  final String content;
  @override
  final int numberOfQuestions;
  @override
  final int typeOfQuestions;

  @override
  String toString() {
    return 'QuizGenerationModel(content: $content, numberOfQuestions: $numberOfQuestions, typeOfQuestions: $typeOfQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizGenerationModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.numberOfQuestions, numberOfQuestions) ||
                other.numberOfQuestions == numberOfQuestions) &&
            (identical(other.typeOfQuestions, typeOfQuestions) ||
                other.typeOfQuestions == typeOfQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, numberOfQuestions, typeOfQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizGenerationModelImplCopyWith<_$QuizGenerationModelImpl> get copyWith =>
      __$$QuizGenerationModelImplCopyWithImpl<_$QuizGenerationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizGenerationModelImplToJson(
      this,
    );
  }
}

abstract class _QuizGenerationModel implements QuizGenerationModel {
  const factory _QuizGenerationModel(
      {required final String content,
      required final int numberOfQuestions,
      required final int typeOfQuestions}) = _$QuizGenerationModelImpl;

  factory _QuizGenerationModel.fromJson(Map<String, dynamic> json) =
      _$QuizGenerationModelImpl.fromJson;

  @override
  String get content;
  @override
  int get numberOfQuestions;
  @override
  int get typeOfQuestions;
  @override
  @JsonKey(ignore: true)
  _$$QuizGenerationModelImplCopyWith<_$QuizGenerationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
