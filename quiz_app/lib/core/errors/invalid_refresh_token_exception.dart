import 'package:equatable/equatable.dart';

class InvalidRefreshTokenException extends Equatable implements Exception {
  const InvalidRefreshTokenException({this.message = 'Invalid refresh token', this.statusCode = 401});
  final String message;
  final dynamic statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
