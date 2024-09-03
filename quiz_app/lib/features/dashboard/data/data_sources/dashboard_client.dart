import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_constants.dart';
import '../../domain/quiz_list_model.dart';

part 'dashboard_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DashboardClient {
  factory DashboardClient(Dio dio, {String baseUrl}) = _DashboardClient;

  @GET(ApiConstants.quizListEndpoint)
  Future<QuizListModel> getQuizList(
    @Query('Page') int page,
    @Query('PageSize') int pageSize,
  );

  @DELETE(ApiConstants.deleteQuizEndpoint)
  Future<void> deleteQuiz(@Path('id') String id);
}

final dashboardClientProvider = Provider<DashboardClient>(
  (ref) => DashboardClient(Dio(), baseUrl: ApiConstants.baseUrl),
);