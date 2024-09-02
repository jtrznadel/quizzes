import '../../domain/quiz_details_model.dart';
import '../data_sources/quiz_details_client.dart';

abstract class QuizDetailsRepository {
  Future<QuizDetailsModel> getQuizDetails(String id);
}

class QuizDetailsRepositoryImpl implements QuizDetailsRepository {
  final QuizDetailsClient _quizDetailsClient;

  QuizDetailsRepositoryImpl(this._quizDetailsClient);

  @override
  Future<QuizDetailsModel> getQuizDetails(String id) async {
    return await _quizDetailsClient.getQuiz(id);
  }
}