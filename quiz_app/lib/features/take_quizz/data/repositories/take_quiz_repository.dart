import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/quiz_participation_model.dart';
import '../data_sources/take_quiz_client.dart';

part 'take_quiz_repository.g.dart';

abstract class TakeQuizRepository {
  ResultFuture<void> submitQuiz({
    required QuizParticipationModel participationModel,
  });
}

class TakeQuizRepositoryImpl implements TakeQuizRepository {
  final TakeQuizClient _takeQuizClient;

  TakeQuizRepositoryImpl(this._takeQuizClient);

  @override
  ResultFuture<void> submitQuiz({
    required QuizParticipationModel participationModel,
  }) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

@riverpod
TakeQuizRepository takeQuizRepository(TakeQuizRepositoryRef ref) => TakeQuizRepositoryImpl(ref.read(takeQuizClientProvider));
