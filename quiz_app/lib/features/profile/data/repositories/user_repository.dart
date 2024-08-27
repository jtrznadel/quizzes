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
    final user = await _userClient.getUser();
    return Right(user);
  }

  @override
  ResultFuture<void> updateUser({
    required User user,
  }) async {
    await _userClient.updateUser(user.toJson());
    return const Right(null);
  }
}

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(ref.watch(userClientProvider)));
