import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../data_sources/auth_client.dart';
import '../../domain/user_auth.dart';
import '../../domain/token_auth.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  ResultFuture<void> signUp({
    required UserAuth userAuth,
  });
  ResultFuture<TokenAuth> signIn({
    required UserAuth userAuth,
  });
  ResultFuture<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authClient);

  final AuthClient _authClient;

  @override
  ResultFuture<void> signUp({
    required UserAuth userAuth,
  }) async {
    try {
      await _authClient.signUp(userAuth.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  ResultFuture<TokenAuth> signIn({
    required UserAuth userAuth,
  }) async {
    try {
      final result = await _authClient.signIn(userAuth.toJson());
      return Right(result);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      await _authClient.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepositoryImpl(ref.read(authClientProvider));
