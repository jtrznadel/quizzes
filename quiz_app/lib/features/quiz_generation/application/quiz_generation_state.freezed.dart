// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_generation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizGenerationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generating,
    required TResult Function(QuizModel quiz) generated,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generating,
    TResult? Function(QuizModel quiz)? generated,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generating,
    TResult Function(QuizModel quiz)? generated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizGenerationStateCopyWith<$Res> {
  factory $QuizGenerationStateCopyWith(
          QuizGenerationState value, $Res Function(QuizGenerationState) then) =
      _$QuizGenerationStateCopyWithImpl<$Res, QuizGenerationState>;
}

/// @nodoc
class _$QuizGenerationStateCopyWithImpl<$Res, $Val extends QuizGenerationState>
    implements $QuizGenerationStateCopyWith<$Res> {
  _$QuizGenerationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GeneratingImplCopyWith<$Res> {
  factory _$$GeneratingImplCopyWith(
          _$GeneratingImpl value, $Res Function(_$GeneratingImpl) then) =
      __$$GeneratingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneratingImplCopyWithImpl<$Res>
    extends _$QuizGenerationStateCopyWithImpl<$Res, _$GeneratingImpl>
    implements _$$GeneratingImplCopyWith<$Res> {
  __$$GeneratingImplCopyWithImpl(
      _$GeneratingImpl _value, $Res Function(_$GeneratingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GeneratingImpl implements _Generating {
  const _$GeneratingImpl();

  @override
  String toString() {
    return 'QuizGenerationState.generating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeneratingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generating,
    required TResult Function(QuizModel quiz) generated,
    required TResult Function(String message) error,
  }) {
    return generating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generating,
    TResult? Function(QuizModel quiz)? generated,
    TResult? Function(String message)? error,
  }) {
    return generating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generating,
    TResult Function(QuizModel quiz)? generated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return generating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return generating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating(this);
    }
    return orElse();
  }
}

abstract class _Generating implements QuizGenerationState {
  const factory _Generating() = _$GeneratingImpl;
}

/// @nodoc
abstract class _$$GeneratedImplCopyWith<$Res> {
  factory _$$GeneratedImplCopyWith(
          _$GeneratedImpl value, $Res Function(_$GeneratedImpl) then) =
      __$$GeneratedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuizModel quiz});

  $QuizModelCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$GeneratedImplCopyWithImpl<$Res>
    extends _$QuizGenerationStateCopyWithImpl<$Res, _$GeneratedImpl>
    implements _$$GeneratedImplCopyWith<$Res> {
  __$$GeneratedImplCopyWithImpl(
      _$GeneratedImpl _value, $Res Function(_$GeneratedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
  }) {
    return _then(_$GeneratedImpl(
      null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as QuizModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizModelCopyWith<$Res> get quiz {
    return $QuizModelCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc

class _$GeneratedImpl implements _Generated {
  const _$GeneratedImpl(this.quiz);

  @override
  final QuizModel quiz;

  @override
  String toString() {
    return 'QuizGenerationState.generated(quiz: $quiz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quiz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratedImplCopyWith<_$GeneratedImpl> get copyWith =>
      __$$GeneratedImplCopyWithImpl<_$GeneratedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generating,
    required TResult Function(QuizModel quiz) generated,
    required TResult Function(String message) error,
  }) {
    return generated(quiz);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generating,
    TResult? Function(QuizModel quiz)? generated,
    TResult? Function(String message)? error,
  }) {
    return generated?.call(quiz);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generating,
    TResult Function(QuizModel quiz)? generated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(quiz);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return generated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return generated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(this);
    }
    return orElse();
  }
}

abstract class _Generated implements QuizGenerationState {
  const factory _Generated(final QuizModel quiz) = _$GeneratedImpl;

  QuizModel get quiz;
  @JsonKey(ignore: true)
  _$$GeneratedImplCopyWith<_$GeneratedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$QuizGenerationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'QuizGenerationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generating,
    required TResult Function(QuizModel quiz) generated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generating,
    TResult? Function(QuizModel quiz)? generated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generating,
    TResult Function(QuizModel quiz)? generated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements QuizGenerationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
