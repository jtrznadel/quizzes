import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/auth/data/models/user_model.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      name: model.name,
    );
  }

  @override
  List<Object?> get props => [id, email];
}
