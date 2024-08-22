import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/network/api_constants.dart';
import 'package:quiz_app/core/network/dio_client.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.authUrl));

@RestApi(baseUrl: ApiConstants.authUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST(ApiConstants.signUpEndpoint)
  Future<void> signup(@Body() Map<String, dynamic> body);
}

final authClientProvider = Provider<AuthClient>((ref) => AuthClient(ref.watch(dioProvider), baseUrl: ApiConstants.authUrl));
