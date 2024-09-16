import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../quizz_details/domain/quiz_details_model.dart';
import '../../domain/quiz_participation_model.dart';
import '../data_sources/take_quiz_client.dart';

part 'take_quiz_repository.g.dart';

abstract class TakeQuizRepository {
  ResultFuture<void> submitQuiz({
    required QuizParticipationModel participationModel,
  });
  //TODO: Change with the actual method (its temporary)
  ResultFuture<QuizDetailsModel> getQuizByInvitation({required String id});
}

class TakeQuizRepositoryImpl implements TakeQuizRepository {
  final TakeQuizClient _takeQuizClient;

  TakeQuizRepositoryImpl(this._takeQuizClient);

  @override
  ResultFuture<void> submitQuiz({
    required QuizParticipationModel participationModel,
  }) async {
    try {
      await _takeQuizClient.submitParticipation(participationModel.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  //TODO: Change with the actual method (its temporary)
  @override
  ResultFuture<QuizDetailsModel> getQuizByInvitation({required String id}) async {
    try {
      final result = await _takeQuizClient.getQuiz(id);
      return Right(result);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}

@riverpod
TakeQuizRepository takeQuizRepository(TakeQuizRepositoryRef ref) => TakeQuizRepositoryImpl(ref.read(takeQuizClientProvider));
