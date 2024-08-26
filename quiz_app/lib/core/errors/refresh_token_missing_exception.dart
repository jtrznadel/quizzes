import 'token_exception.dart';

class RefreshTokenMissingException implements TokenException {
  @override
  String get message => 'Refresh token is missing';
  
  @override
  List<Object?> get props => [message];
  
  @override
  bool? get stringify => true;
}