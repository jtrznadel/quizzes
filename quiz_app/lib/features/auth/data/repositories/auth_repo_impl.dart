import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/server_exception.dart';
import 'package:quiz_app/core/errors/server_failure.dart';
import 'package:quiz_app/core/utils/typedefs.dart';
import 'package:quiz_app/features/auth/data/data_sources/user_api_service.dart';
import 'package:quiz_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._remoteDataSource);

  final UserApiService _remoteDataSource;

  @override
  ResultFuture<AuthResponseEntity> signIn({required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.signin({
        'email': email,
        'password': password,
      });
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> signUp({required String email, required String password, required String name}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
