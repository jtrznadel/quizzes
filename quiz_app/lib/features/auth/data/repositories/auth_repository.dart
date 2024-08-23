import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/errors/server_exception.dart';
import 'package:quiz_app/core/utils/typedefs.dart';
import 'package:quiz_app/features/auth/data/data_sources/auth_client.dart';
import 'package:quiz_app/features/auth/domain/user_auth.dart';

abstract class AuthRepository {
  ResultFuture<void> signUp({
    required UserAuth userAuth,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authClient);

  final AuthClient _authClient;

  @override
  ResultFuture<void> signUp({
    required UserAuth userAuth,
  }) async {
    try {
      await _authClient.signup(userAuth.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref.watch(authClientProvider)));
