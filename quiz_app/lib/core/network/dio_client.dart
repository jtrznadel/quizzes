import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
        String? accessToken = await ref.read(sessionProvider).accessToken;
        if (accessToken != null) {
          bool hasExpired = JwtDecoder.isExpired(accessToken);
          if (hasExpired) {
            final refreshToken = await ref.read(sessionProvider).refreshToken;
            if (refreshToken == null) {
              throw RefreshTokenMissingException(requestOptions: options);
            }
            final tokenResponse = await refreshAccessToken(refreshToken, Dio());
            if (tokenResponse == null) {
              throw AccessTokenRefreshFailureException(requestOptions: options);
            }
            await ref.read(sessionProvider).saveTokens(
                  accessToken: tokenResponse.accessToken,
                  refreshToken: tokenResponse.refreshToken,
                );
          }
          accessToken = await ref.read(sessionProvider).accessToken;
        }
        options.headers[ApiConstants.authHeader] = '${ApiConstants.authBearer}$accessToken';

        options.headers[ApiConstants.contentTypeHeader] = ApiConstants.contentTypeJson;

        if (options.data is FormData) {
          FormData newFormData = FormData();
          newFormData.fields.addAll(options.data.fields);
          newFormData.files.addAll(options.data.files);
          options.data = newFormData;
        }

        return handler.next(options);
      },
      onError: (error, handler) async {
        return handler.next(error);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
    ),
  );
  return dio;
}

Future<TokenAuth?> refreshAccessToken(String refreshToken, Dio dio) async {
  try {
    dio.options = BaseOptions(baseUrl: ApiConstants.baseUrl);
    final response = await dio.post(
      ApiConstants.refreshAccessTokenEndpoint,
      data: {ApiConstants.refreshTokenStorageKey: refreshToken},
    );
    if (response.statusCode == 200) {
      return TokenAuth.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    //kDebugMode ? debugPrint('Error refreshing access token: $e') : null;
    return null;
  }
}

Dio refreshTokenDioClient(String base, Ref ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final refreshToken = await ref.read(sessionProvider).refreshToken;
        if (refreshToken == null) {
          throw RefreshTokenMissingException(requestOptions: options);
        }
        options.headers[ApiConstants.contentTypeHeader] = ApiConstants.contentTypeJson;
        return handler.next(options);
      },
      onError: (error, handler) async {
        return handler.next(error);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
    ),
  );
  return dio;
}
