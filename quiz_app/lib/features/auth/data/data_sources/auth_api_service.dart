import 'package:dio/dio.dart';
import 'package:quiz_app/core/network/api_constants.dart';
import 'package:quiz_app/features/auth/data/models/auth_response_model.dart';
import 'package:quiz_app/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.authUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.signUpEndpoint)
  Future<AuthResponseModel> signup(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.signInEndpoint)
  Future<AuthResponseModel> signin(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.userEndpoint)
  Future<UserModel> getUser();

  @PATCH(ApiConstants.updateUserEndpoint)
  Future<UserModel> updateUser(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.deleteUserEndpoint)
  Future<void> deleteUser();

  @POST(ApiConstants.signOutEndpoint)
  Future<void> signOut();
}