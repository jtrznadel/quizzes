import 'package:dio/dio.dart';
import 'package:quiz_app/core/errors/invalid_refresh_token_exception.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        final accessToken = _getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options); 
      }, onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = _getRefreshToken();
          if (refreshToken != null) {
            final tokenResponse = await _refreshAccessToken(refreshToken);
            if (tokenResponse != null) {
              _saveNewAccessToken(tokenResponse);
              final retryRequest = error.requestOptions
                ..headers['Authorization'] = 'Bearer $tokenResponse';
              final response = await _dio.fetch(retryRequest);

              return handler.resolve(response);
            }
          }
          else{
            throw InvalidRefreshTokenException();
          }
        }
        return handler.next(error);
      }),
    );
  }

  String? _getAccessToken() {
    // TODO('Get access token from secure storage')
    return null;
  }

  String? _getRefreshToken() {
    // TODO('Get refresh token from secure storage')
    return null;
  }

  Future<String?> _refreshAccessToken(String refreshToken) async {
    // TODO('Refresh access token')
    return null;
  }

  void _saveNewAccessToken(String accessToken) {
    // TODO('Save tokens to secure storage')
  }
}
