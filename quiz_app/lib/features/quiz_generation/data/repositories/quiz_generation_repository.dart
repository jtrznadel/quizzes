import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/create_quiz_model.dart';
import '../../domain/generate_quiz_model.dart';
import '../../domain/quiz_request_model.dart';
import '../data_sources/quiz_generation_client.dart';

abstract class QuizGenerationRepository {
  ResultFuture<GenerateQuizModel> generateQuiz({
    required QuizRequestModel quizRequestModel,
  });

  ResultFuture<String> createQuiz({
    required CreateQuizModel quizModel,
  });
}

class QuizGenerationRepositoryImpl implements QuizGenerationRepository {
  QuizGenerationRepositoryImpl(this._quizGenerationClient);

  final QuizGenerationClient _quizGenerationClient;

  @override
  ResultFuture<GenerateQuizModel> generateQuiz({
    required QuizRequestModel quizRequestModel,
  }) async {
    try {
      final model = await _quizGenerationClient.generateQuiz(
        content: quizRequestModel.content,
        numberOfQuestions: quizRequestModel.numberOfQuestions,
        questionTypes: quizRequestModel.questionTypes,
        attachments: quizRequestModel.attachments,
      );
      return Right(model);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> createQuiz({
    required CreateQuizModel quizModel,
  }) async {
    try {
      final model = await _quizGenerationClient.createQuiz(quizModel.toJson());
      return Right(model);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

final quizGenerationRepositoryProvider = Provider<QuizGenerationRepository>(
  (ref) => QuizGenerationRepositoryImpl(ref.watch(quizGenerationClientProvider)),
);
