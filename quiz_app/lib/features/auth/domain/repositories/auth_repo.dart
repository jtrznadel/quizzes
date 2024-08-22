import '../../../../core/utils/typedefs.dart';
import '../entities/auth_response_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  ResultFuture<AuthResponseEntity> signIn({required String email, required String password});

  ResultFuture<void> signUp({required String email, required String password, required String name});

  ResultFuture<void> signOut();

  ResultFuture<void> updateUser({required UserEntity user});

  ResultFuture<UserEntity> getUser();

  ResultFuture<void> deleteUser();
}
