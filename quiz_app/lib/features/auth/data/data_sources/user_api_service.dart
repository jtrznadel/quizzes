import 'package:dio/dio.dart';
import 'package:quiz_app/core/network/api_constants.dart';
import 'package:quiz_app/features/auth/data/models/auth_response_model.dart';
import 'package:quiz_app/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.authUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @POST(ApiConstants.signUpEndpoint)
  Future<AuthResponseModel> signup(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.signInEndpoint)
  Future<AuthResponseModel> signin(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.userEndpoint)
  Future<UserModel> getUser(@Path('id') String id);

  @PATCH(ApiConstants.updateUserEndpoint)
  Future<UserModel> updateUser(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.deleteUserEndpoint)
  Future<void> deleteUser(@Path('id') String id);
}