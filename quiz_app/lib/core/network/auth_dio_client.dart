import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/access_token_refresh_failure_exception.dart';
import '../errors/refresh_token_missing_exception.dart';
import '../services/session_provider.dart';
import 'api_constants.dart';
import 'base_dio_client.dart';

part 'auth_dio_client.g.dart';

@riverpod
Dio authDioClient(AuthDioClientRef ref) => buildDioClient(ApiConstants.authUrl, ref);

Dio buildDioClient(String base, AuthDioClientRef ref) {
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
        options.headers[ApiConstants.authHeader] =
            '${ApiConstants.authBearer}$accessToken';

        options.headers[ApiConstants.contentTypeHeader] =
            ApiConstants.contentTypeJson;

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