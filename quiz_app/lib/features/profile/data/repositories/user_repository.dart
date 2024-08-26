import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/user.dart';
import '../data_sources/user_client.dart';

abstract class UserRepository {

  ResultFuture<User> getUser();

  ResultFuture<void> updateUser({
    required User user,
  });

}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userClient);

  final UserClient _userClient;

  @override
  ResultFuture<User> getUser() async {
    try {
      final user = await _userClient.getUser();
      return Right(user);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> updateUser({
    required User user,
  }) async {
    try {
      await _userClient.updateUser(user.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepositoryImpl(ref.watch(userClientProvider)));