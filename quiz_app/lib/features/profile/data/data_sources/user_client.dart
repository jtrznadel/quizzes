
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/base_dio_client.dart';
import '../../domain/user.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET(ApiConstants.userEndpoint)
  Future<User> getUser();

  @PUT(ApiConstants.updateUserEndpoint)
  Future<void> updateUser(@Body() Map<String, dynamic> body);

  @POST('auth/${ApiConstants.signOutEndpoint}')
  Future<void> signOut();
}

@riverpod
UserClient userClient(UserClientRef ref) =>
    UserClient(ref.read(baseDioClientProvider), baseUrl: ApiConstants.baseUrl);