import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/domain/token_auth.dart';
import '../errors/access_token_refresh_failure_exception.dart';
import '../errors/refresh_token_missing_exception.dart';
import '../services/session_provider.dart';
import 'api_constants.dart';

Dio buildDioClient(String base, Ref ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers[ApiConstants.contentTypeHeader] = ApiConstants.contentTypeJson;
        final accessToken = await ref.read(sessionProvider).accessToken;
        if (accessToken != null) {
          options.headers[ApiConstants.authHeader] = '${ApiConstants.authBearer}$accessToken';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await ref.read(sessionProvider).refreshToken ??
              () {
                //TODO: Log out user
                ref.read(sessionProvider).deleteTokens();
                throw RefreshTokenMissingException();
              }();
          final tokenResponse = await refreshAccessToken(refreshToken, dio);
          await ref.read(sessionProvider).saveTokens(
                accessToken: tokenResponse.accessToken,
                refreshToken: tokenResponse.refreshToken,
              );
          final retryRequest = error.requestOptions..headers[ApiConstants.authHeader] = '${ApiConstants.authBearer}$tokenResponse';
          final response = await dio.fetch(retryRequest);

          return handler.resolve(response);
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
}

Future<TokenAuth> refreshAccessToken(String refreshToken, Dio dio) async {
  try {
    final response = await dio.post(
      ApiConstants.refreshAccessTokenEndpoint,
      data: {'refresh_token': refreshToken},
    );
    if (response.statusCode == 200) {
      return TokenAuth.fromJson(response.data);
    } else {
      throw AccessTokenRefreshFailureException(statusCode: response.statusCode);
    }
  } catch (e) {
    //kDebugMode ? debugPrint('Error refreshing access token: $e') : null;
    throw AccessTokenRefreshFailureException();
  }
}
