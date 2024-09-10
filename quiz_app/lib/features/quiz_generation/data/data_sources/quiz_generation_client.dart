import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import 'package:retrofit/http.dart';

import '../../domain/generate_quiz_model.dart';

part 'quiz_generation_client.g.dart';

final dioProvider = Provider<Dio>((ref) => buildDioClient(ApiConstants.baseUrl, ref));

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class QuizGenerationClient {
  factory QuizGenerationClient(Dio dio, {String baseUrl}) = _QuizGenerationClient;

  @POST(ApiConstants.quizGenerationEndpoint)
  @MultiPart()
  Future<GenerateQuizModel> generateQuiz({
    @Part(name: "Content") required String content,
    @Part(name: "NumberOfQuestions") required int numberOfQuestions,
    @Part(name: "QuestionTypes") required String questionTypes,
    @Part(name: "Attachments") required List<MultipartFile> attachments,
  });

  @POST(ApiConstants.quizCreateEndpoint)
  Future<String> createQuiz(@Body() Map<String, dynamic> body);
}

final quizGenerationClientProvider =
    Provider<QuizGenerationClient>((ref) => QuizGenerationClient(ref.watch(dioProvider), baseUrl: ApiConstants.baseUrl));
