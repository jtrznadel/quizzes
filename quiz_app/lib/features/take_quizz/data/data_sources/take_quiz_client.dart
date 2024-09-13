import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/base_dio_client.dart';
import '../../domain/quiz_result_model.dart';

part 'take_quiz_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TakeQuizClient {
  factory TakeQuizClient(Dio dio, {String baseUrl}) = _TakeQuizClient;

  @POST(ApiConstants.submitParticipationEndpoint)
  Future<void> submitParticipation(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.getQuizResult)
  Future<QuizResultModel> getQuizResult(@Path('id') String id);
}

@riverpod
TakeQuizClient takeQuizClient(TakeQuizClientRef ref) => TakeQuizClient(ref.read(baseDioClientProvider), baseUrl: ApiConstants.baseUrl);
