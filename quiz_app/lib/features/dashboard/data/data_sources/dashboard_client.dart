import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/quiz_list_model.dart';

part 'dashboard_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.baseUrl, ref));

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DashboardClient {
  factory DashboardClient(Dio dio, {String baseUrl}) = _DashboardClient;

  @GET(ApiConstants.quizListEndpoint)
  Future<QuizListModel> getQuizList(
    @Query(ApiConstants.quizListPageQuery) int page,
    @Query(ApiConstants.quizListPageSizeQuery) int pageSize,
  );

  @DELETE(ApiConstants.deleteQuizEndpoint)
  Future<void> deleteQuiz(@Path('id') String id);
}

final dashboardClientProvider = Provider<DashboardClient>(
  (ref) => DashboardClient(ref.watch(dioProvider), baseUrl: ApiConstants.baseUrl),
);