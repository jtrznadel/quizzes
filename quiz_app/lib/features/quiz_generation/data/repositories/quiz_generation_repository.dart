import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/quiz_generation_model.dart';
import '../../domain/quiz_model.dart';
import '../data_sources/quiz_generation_client.dart';

abstract class QuizGenerationRepository {
  ResultFuture<QuizModel> generateQuiz({
    required QuizGenerationModel quizGenerationModel,
  });

  ResultFuture<String> createQuiz({
    required QuizModel quizModel,
  });
}

class QuizGenerationRepositoryImpl implements QuizGenerationRepository {
  QuizGenerationRepositoryImpl(this._quizGenerationClient);

  final QuizGenerationClient _quizGenerationClient;

  @override
  ResultFuture<QuizModel> generateQuiz({
    required QuizGenerationModel quizGenerationModel,
  }) async {
    try {
      final model = await _quizGenerationClient
          .generateQuiz(quizGenerationModel.toJson());
      return Right(model);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> createQuiz({
    required QuizModel quizModel,
  }) async {
    try {
      //TODO: replace quizToJson with the correct method after implementation
      final model = await _quizGenerationClient.createQuiz(quizModel.toJson());
      return Right(model);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

final quizGenerationRepositoryProvider = Provider<QuizGenerationRepository>(
  (ref) =>
      QuizGenerationRepositoryImpl(ref.watch(quizGenerationClientProvider)),
);
