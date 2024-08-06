import 'package:quiz_app/core/utils/typedefs.dart';
import 'package:quiz_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepo {
  ResultFuture<AuthResponseEntity> signIn({required String email, required String password});

  ResultFuture<void> signUp({required String email, required String password, required String name});

  ResultFuture<void> signOut();
}
