
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/quiz_details_model.dart';

part 'quiz_details_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.baseUrl, ref));

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class QuizDetailsClient {
  factory QuizDetailsClient(Dio dio, {String baseUrl}) = _QuizDetailsClient;

  @GET(ApiConstants.getQuizEndpoint)
  Future<QuizDetailsModel> getQuiz(@Path('id') String id);

  @PATCH(ApiConstants.updateQuizStatusEndpoint)
  Future<void> updateQuizStatus(@Path('id') String id, @Body() String status);

  @PATCH(ApiConstants.updateQuizAvailabilityEndpoint)
  Future<void> updateQuizAvailability(@Path('id') String id, @Body() String availability);

  @PUT(ApiConstants.updateQuizDetailsEndpoint)      
  Future<void> updateQuizDetails(@Body() Map<String, dynamic> quizDetails);
}

final quizDetailsClientProvider = Provider<QuizDetailsClient>(
  (ref) => QuizDetailsClient(ref.read(dioProvider)),
);