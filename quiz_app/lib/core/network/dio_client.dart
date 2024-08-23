import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../errors/access_token_refresh_failure_exception.dart';
import '../errors/refresh_token_missing_exception.dart';
import 'api_constants.dart';
import '../storage/secure_storage.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        final accessToken = await _getAccessToken();
        if(accessToken != null) {
          options.headers[ApiConstants.authHeader] = '${ApiConstants.authBearer}$accessToken';
        }
        return handler.next(options);
      }, onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await _getRefreshToken() ??
              () {
                //TODO('Log out user');
                _clearAllTokens();
                throw RefreshTokenMissingException();
              }();
          final tokenResponse = await _refreshAccessToken(refreshToken);
          _saveNewAccessToken(tokenResponse);
          final retryRequest = error.requestOptions
            ..headers[ApiConstants.authHeader] = '${ApiConstants.authBearer}$tokenResponse';
          final response = await _dio.fetch(retryRequest);

          return handler.resolve(response);
        }
        return handler.next(error);
      }),
    );
  }

  Future<String?> _getAccessToken() async {
    return await SecureStorage().read(key: ApiConstants.accessTokenStorageKey);
  }

  Future<String?> _getRefreshToken() async {
    return await SecureStorage().read(key: ApiConstants.refreshTokenStorageKey);
  }

  Future<String> _refreshAccessToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        ApiConstants.refreshAccessTokenEndpoint,
        data: {'refresh_token': refreshToken},
      );
      if (response.statusCode == 200) {
        return response.data['access_token'];
      }
      else{
        throw AccessTokenRefreshFailureException(statusCode: response.statusCode);
      }
    } catch (e) {
      kDebugMode ? debugPrint('Error refreshing access token: $e') : null;
      throw AccessTokenRefreshFailureException();
    }
  }

  Future<void> _clearAllTokens() async {
    await SecureStorage().delete(key: ApiConstants.accessTokenStorageKey);
    await SecureStorage().delete(key: ApiConstants.refreshTokenStorageKey);
  }

  Future<void> _saveNewAccessToken(String accessToken) async {
    await SecureStorage()
        .write(key: ApiConstants.accessTokenStorageKey, value: accessToken);
  }
}
