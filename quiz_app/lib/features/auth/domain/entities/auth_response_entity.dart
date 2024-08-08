import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/auth/data/models/auth_response_model.dart';
import 'package:quiz_app/features/auth/domain/entities/user_entity.dart';

class AuthResponseEntity extends Equatable {
  const AuthResponseEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  final UserEntity user;
  final String accessToken;
  final String refreshToken;

  factory AuthResponseEntity.fromModel(AuthResponseModel model) {
    return AuthResponseEntity(
      user: UserEntity.fromModel(model.user),
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  @override
  List<Object?> get props => [user, accessToken, refreshToken];
}
