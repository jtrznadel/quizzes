class ApiConstants {
  static const String baseUrl = 'https://mlab2024-backend.yellowocean-31330507.westeurope.azurecontainerapps.io/api/';
  static const String authUrl = '${baseUrl}auth';
  static const String signUpEndpoint = '/signup';
  static const String signInEndpoint = '/signin';
  static const String userEndpoint = '/profile';
  static const String updateUserEndpoint = '/profile';
  //TODO: not implemented on backend yet
  static const String deleteUserEndpoint = '/delete_user';
  static const String signOutEndpoint = '/logout';

  static const String refreshAccessTokenEndpoint = '/refresh-token';

  static const String authHeader = 'Authorization';
  static const String authBearer = 'Bearer ';

  static const String contentTypeHeader = 'Content-Type';
  static const String contentTypeJson = 'application/json';

  static const String accessTokenStorageKey = 'accessToken';
  static const String refreshTokenStorageKey = 'refreshToken';
}
