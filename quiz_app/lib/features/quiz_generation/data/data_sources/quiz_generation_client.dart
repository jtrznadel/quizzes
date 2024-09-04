import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/quiz_model.dart';
import 'package:retrofit/http.dart';

part 'quiz_generation_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.baseUrl, ref));

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class QuizGenerationClient {
  factory QuizGenerationClient(Dio dio, {String baseUrl}) =
      _QuizGenerationClient;

  @POST(ApiConstants.quizGenerationEndpoint)
  Future<QuizModel> generateQuiz(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.quizCreateEndpoint)
  Future<String> createQuiz(@Body() Map<String, dynamic> body);
}

final quizGenerationClientProvider = Provider<QuizGenerationClient>((ref) =>
    QuizGenerationClient(ref.watch(dioProvider),
        baseUrl: ApiConstants.baseUrl));