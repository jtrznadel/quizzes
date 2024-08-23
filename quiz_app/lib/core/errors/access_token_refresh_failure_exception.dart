import 'server_exception.dart';

class AccessTokenRefreshFailureException implements ServerException {
  @override
  final dynamic statusCode;

  AccessTokenRefreshFailureException({this.statusCode});

  @override
  String get message => 'Failed to refresh access token';

  @override
  List<Object?> get props => [message, statusCode];
  
  @override
  bool? get stringify => true;
  
}