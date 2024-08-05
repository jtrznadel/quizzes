import 'package:quiz_app/core/errors/server_exception.dart';

class InvalidRefreshTokenException implements ServerException {
  String get message => 'Invalid refresh token';
}