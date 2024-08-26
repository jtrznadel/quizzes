import 'package:dio/dio.dart';
import '../errors/access_token_refresh_failure_exception.dart';
import '../errors/refresh_token_missing_exception.dart';
import 'api_constants.dart';
import '../storage/secure_storage.dart';

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers[ApiConstants.contentTypeHeader] =
            ApiConstants.contentTypeJson;
        final accessToken = await getAccessToken();
        if (accessToken != null) {
          options.headers[ApiConstants.authHeader] =
              '${ApiConstants.authBearer}$accessToken';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await getRefreshToken() ??
              () {
                //TODO: Log out user
                clearAllTokens();
              }();
          if (refreshToken == null) {
            return handler.next(
              RefreshTokenMissingException(
                  requestOptions: error.requestOptions),
            );
          }
          final tokenResponse = await refreshAccessToken(refreshToken, dio);
          saveNewAccessToken(tokenResponse);
          final retryRequest = error.requestOptions
            ..headers[ApiConstants.authHeader] =
                '${ApiConstants.authBearer}$tokenResponse';
          final response = await dio.fetch(retryRequest);
          return handler.resolve(response);
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
}

Future<String?> getAccessToken() async {
  return await SecureStorage().read(key: ApiConstants.accessTokenStorageKey);
}

Future<String?> getRefreshToken() async {
  return await SecureStorage().read(key: ApiConstants.refreshTokenStorageKey);
}

Future<String> refreshAccessToken(String refreshToken, Dio dio) async {
  try {
    final response = await dio.post(
      ApiConstants.refreshAccessTokenEndpoint,
      data: {'refresh_token': refreshToken},
    );
    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      throw AccessTokenRefreshFailureException(statusCode: response.statusCode);
    }
  } catch (e) {
    //kDebugMode ? debugPrint('Error refreshing access token: $e') : null;
    throw AccessTokenRefreshFailureException();
  }
}

Future<void> clearAllTokens() async {
  await SecureStorage().delete(key: ApiConstants.accessTokenStorageKey);
  await SecureStorage().delete(key: ApiConstants.refreshTokenStorageKey);
}

Future<void> saveNewAccessToken(String accessToken) async {
  await SecureStorage()
      .write(key: ApiConstants.accessTokenStorageKey, value: accessToken);
}
