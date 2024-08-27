// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  bool get isUsernameUpdating => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isUsernameUpdating) loading,
    required TResult Function(User user, bool isUsernameUpdating) success,
    required TResult Function(Exception message, bool isUsernameUpdating) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isUsernameUpdating)? loading,
    TResult? Function(User user, bool isUsernameUpdating)? success,
    TResult? Function(Exception message, bool isUsernameUpdating)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isUsernameUpdating)? loading,
    TResult Function(User user, bool isUsernameUpdating)? success,
    TResult Function(Exception message, bool isUsernameUpdating)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({bool isUsernameUpdating});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUsernameUpdating = null,
  }) {
    return _then(_value.copyWith(
      isUsernameUpdating: null == isUsernameUpdating
          ? _value.isUsernameUpdating
          : isUsernameUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isUsernameUpdating});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUsernameUpdating = null,
  }) {
    return _then(_$LoadingImpl(
      isUsernameUpdating: null == isUsernameUpdating
          ? _value.isUsernameUpdating
          : isUsernameUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.isUsernameUpdating = false});

  @override
  @JsonKey()
  final bool isUsernameUpdating;

  @override
  String toString() {
    return 'UserState.loading(isUsernameUpdating: $isUsernameUpdating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.isUsernameUpdating, isUsernameUpdating) ||
                other.isUsernameUpdating == isUsernameUpdating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUsernameUpdating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isUsernameUpdating) loading,
    required TResult Function(User user, bool isUsernameUpdating) success,
    required TResult Function(Exception message, bool isUsernameUpdating) error,
  }) {
    return loading(isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isUsernameUpdating)? loading,
    TResult? Function(User user, bool isUsernameUpdating)? success,
    TResult? Function(Exception message, bool isUsernameUpdating)? error,
  }) {
    return loading?.call(isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isUsernameUpdating)? loading,
    TResult Function(User user, bool isUsernameUpdating)? success,
    TResult Function(Exception message, bool isUsernameUpdating)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isUsernameUpdating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading({final bool isUsernameUpdating}) = _$LoadingImpl;

  @override
  bool get isUsernameUpdating;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, bool isUsernameUpdating});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isUsernameUpdating = null,
  }) {
    return _then(_$SuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isUsernameUpdating: null == isUsernameUpdating
          ? _value.isUsernameUpdating
          : isUsernameUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.user, {this.isUsernameUpdating = false});

  @override
  final User user;
  @override
  @JsonKey()
  final bool isUsernameUpdating;

  @override
  String toString() {
    return 'UserState.success(user: $user, isUsernameUpdating: $isUsernameUpdating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isUsernameUpdating, isUsernameUpdating) ||
                other.isUsernameUpdating == isUsernameUpdating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isUsernameUpdating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isUsernameUpdating) loading,
    required TResult Function(User user, bool isUsernameUpdating) success,
    required TResult Function(Exception message, bool isUsernameUpdating) error,
  }) {
    return success(user, isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isUsernameUpdating)? loading,
    TResult? Function(User user, bool isUsernameUpdating)? success,
    TResult? Function(Exception message, bool isUsernameUpdating)? error,
  }) {
    return success?.call(user, isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isUsernameUpdating)? loading,
    TResult Function(User user, bool isUsernameUpdating)? success,
    TResult Function(Exception message, bool isUsernameUpdating)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user, isUsernameUpdating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UserState {
  const factory _Success(final User user, {final bool isUsernameUpdating}) =
      _$SuccessImpl;

  User get user;
  @override
  bool get isUsernameUpdating;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Exception message, bool isUsernameUpdating});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isUsernameUpdating = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Exception,
      isUsernameUpdating: null == isUsernameUpdating
          ? _value.isUsernameUpdating
          : isUsernameUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message, {this.isUsernameUpdating = false});

  @override
  final Exception message;
  @override
  @JsonKey()
  final bool isUsernameUpdating;

  @override
  String toString() {
    return 'UserState.error(message: $message, isUsernameUpdating: $isUsernameUpdating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isUsernameUpdating, isUsernameUpdating) ||
                other.isUsernameUpdating == isUsernameUpdating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isUsernameUpdating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isUsernameUpdating) loading,
    required TResult Function(User user, bool isUsernameUpdating) success,
    required TResult Function(Exception message, bool isUsernameUpdating) error,
  }) {
    return error(message, isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isUsernameUpdating)? loading,
    TResult? Function(User user, bool isUsernameUpdating)? success,
    TResult? Function(Exception message, bool isUsernameUpdating)? error,
  }) {
    return error?.call(message, isUsernameUpdating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isUsernameUpdating)? loading,
    TResult Function(User user, bool isUsernameUpdating)? success,
    TResult Function(Exception message, bool isUsernameUpdating)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isUsernameUpdating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserState {
  const factory _Error(final Exception message,
      {final bool isUsernameUpdating}) = _$ErrorImpl;

  Exception get message;
  @override
  bool get isUsernameUpdating;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
