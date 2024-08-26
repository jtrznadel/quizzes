import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(User user) = _Success;
  const factory UserState.error(Exception message) = _Error;
}
