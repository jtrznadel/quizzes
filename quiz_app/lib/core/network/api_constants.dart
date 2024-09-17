class ApiConstants {
  static const String baseUrl = 'https://mlab2024-backend.yellowocean-31330507.westeurope.azurecontainerapps.io/api/';
  static const String authUrl = '${baseUrl}auth';
  static const String signUpEndpoint = '/signup';
  static const String signInEndpoint = '/signin';
  static const String userEndpoint = '/profile';
  static const String updateUserEndpoint = '/profile';
  //TODO: not implemented on backend yet
  static const String deleteUserEndpoint = '/delete_user';
  static const String signOutEndpoint = 'auth/logout';

  static const String refreshAccessTokenEndpoint = 'auth/refresh-token';

  static const String authHeader = 'Authorization';
  static const String authBearer = 'Bearer ';

  static const String contentTypeHeader = 'Content-Type';
  static const String contentTypeJson = 'application/json';

  static const String accessTokenStorageKey = 'accessToken';
  static const String refreshTokenStorageKey = 'refreshToken';

  static const String quizGenerationEndpoint = 'quiz/generate-quiz';
  static const String quizCreateEndpoint = 'quiz/create-quiz';

  static const String getQuizEndpoint = 'quiz/{id}';
  static const String updateQuizStatusEndpoint = 'quiz/{id}/status';
  static const String updateQuizAvailabilityEndpoint = 'quiz/{id}/availability';
  static const String updateQuizDetailsEndpoint = 'quiz';

  static const String deleteQuestionEndpoint = 'questionsandanswers/{id}';
  static const String addQuestionEndpoint = 'questionsandanswers/create-question';
  static const String updateQuestionEndpoint = 'questionsandanswers/update-question';

  static const String quizListEndpoint = 'quiz';
  static const String deleteQuizEndpoint = 'quiz/{id}';
  static const int quizPageSize = 10;
  static const String quizListPageQuery = 'Page';
  static const String quizListPageSizeQuery = 'PageSize';

  static const String joinQuizEndpoint = '{joinCode}';
  static const String submitParticipationEndpoint = 'participations/submit';
  static const String getQuizParticipation = 'participations/{quizParticipationId}';
}
