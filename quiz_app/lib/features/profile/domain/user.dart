import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(includeToJson: false)
    @Default('')
    String id,
    required String userName,
    @JsonKey(includeToJson: false)
    @Default('')
    String email
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}