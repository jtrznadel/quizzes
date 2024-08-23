import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/utils/typedefs.dart';
import '../data_sources/auth_api_service.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApiService authApiService;

  AuthRepoImpl({required this.authApiService});

  @override
  ResultFuture<AuthResponseEntity> signIn(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };

    try {
      final responseModel = await authApiService.signin(body);
      final responseEntity = AuthResponseEntity.fromModel(responseModel);
      return Right(responseEntity);
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final errorMessage = e.response?.statusMessage;
      return Left(ServerException(
          message: errorMessage ?? 'ServerException', statusCode: errorCode));
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      await authApiService.signOut();
      await SecureStorage().clear();
      return const Right(null);
    } catch (e) {
      return const Left(
          ServerException(message: 'Error signing out', statusCode: 500));
    }
  }

  @override
  ResultFuture<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final body = {
      'email': email,
      'password': password,
      'username': name,
    };

    try {
      await authApiService.signup(body);
      return const Right(null);
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final errorMessage = e.response?.statusMessage;
      return Left(ServerException(
          message: errorMessage ?? 'ServerException', statusCode: errorCode));
    }
  }

  @override
  ResultFuture<void> deleteUser() async {
    try {
      authApiService.deleteUser();
      return const Right(null);
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final errorMessage = e.response?.statusMessage;
      return Left(ServerException(
          message: errorMessage ?? 'ServerException', statusCode: errorCode));
    }
  }

  @override
  ResultFuture<UserEntity> getUser() async {
    try{
      final userModel = await authApiService.getUser();
      final userEntity = UserEntity.fromModel(userModel);
      return Right(userEntity);
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final errorMessage = e.response?.statusMessage;
      return Left(ServerException(
          message: errorMessage ?? 'ServerException', statusCode: errorCode));
    }
  }

  @override
  ResultFuture<void> updateUser(
      {required UserEntity user}) async {
      final body = {
        'email': user.email,
        'username' : user.name
      };
    try{
      await authApiService.updateUser(body);
      return const Right(null);
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final errorMessage = e.response?.statusMessage;
      return Left(ServerException(
          message: errorMessage ?? 'ServerException', statusCode: errorCode));
    }
  }
}
