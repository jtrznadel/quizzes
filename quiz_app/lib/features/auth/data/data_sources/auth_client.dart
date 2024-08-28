import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/token_auth.dart';

part 'auth_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.authUrl, ref));

@RestApi(baseUrl: ApiConstants.authUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST(ApiConstants.signUpEndpoint)
  Future<void> signUp(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.signInEndpoint)
  Future<TokenAuth> signIn(@Body() Map<String, dynamic> body);
}

final authClientProvider = Provider<AuthClient>((ref) => AuthClient(ref.watch(dioProvider), baseUrl: ApiConstants.authUrl));
