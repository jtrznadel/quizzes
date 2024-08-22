class ApiConstants {
  static const String baseUrl = 'https://mlab2024-backend.yellowocean-31330507.westeurope.azurecontainerapps.io/api/';
  static const String authUrl = '${baseUrl}auth';
  static const String signUpEndpoint = '/signup';
  static const String signInEndpoint = '/signin';
  static const String userEndpoint = '/user';
  static const String updateUserEndpoint = '/update_user';
  static const String deleteUserEndpoint = '/delete_user';
  static const String signOutEndpoint = '/signout';

  static const String refreshAccessTokenEndpoint = '/refresh_access_token';

  static const String authHeader = 'Authorization';
  static const String authBearer = 'Bearer ';

  static const String contentTypeHeader = 'Content-Type';
  static const String contentTypeJson = 'application/json';

  static const String accessTokenStorageKey = 'accessToken';
  static const String refreshTokenStorageKey = 'refreshToken';
}
