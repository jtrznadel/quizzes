class ApiConstants{
  static const String baseUrl = 'https://api.example.com/';
  static const String authUrl = '${baseUrl}auth';
  static const String signUpEndpoint = '/signup';
  static const String signInEndpoint = '/signin';
  static const String userEndpoint = '/user/{id}';
  static const String updateUserEndpoint = '/update_user';
  static const String deleteUserEndpoint = '/delete_user/{id}';

  static const String refreshAccessTokenEndpoint = '/refresh_access_token';

  static const String authHeader = 'Authorization';
  static const String authBearer = 'Bearer ';

  static const String accessTokenStorageKey = 'accessToken';
  static const String refreshTokenStorageKey = 'refreshToken';
}