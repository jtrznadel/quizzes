
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/user.dart';

part 'user_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.baseUrl, ref));

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

final userClientProvider = Provider<UserClient>((ref) => UserClient(ref.watch(dioProvider), baseUrl: ApiConstants.baseUrl));