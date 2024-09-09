import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/quiz_details_model.dart';
import '../data_sources/quiz_details_client.dart';

abstract class QuizDetailsRepository {
  Future<QuizDetailsModel> getQuizDetails(String id);

  Future<void> updateQuizStatus(String id, QuizStatus status);
  Future<void> updateQuizAvailability(String id, QuizAvailability availability);
  Future<void> updateQuizDetails(String id, String title, String description);
  Future<void> deleteQuestion(String id);
}

class QuizDetailsRepositoryImpl implements QuizDetailsRepository {
  final QuizDetailsClient _quizDetailsClient;

  QuizDetailsRepositoryImpl(this._quizDetailsClient);

  @override
  Future<QuizDetailsModel> getQuizDetails(String id) async {
    return await _quizDetailsClient.getQuiz(id);
  }

  @override
  Future<void> updateQuizStatus(String id, QuizStatus status) async {
    return await _quizDetailsClient.updateQuizStatus(id, '"${status.name}"');
  }

  @override
  Future<void> updateQuizAvailability(String id, QuizAvailability availability) async {
    return await _quizDetailsClient.updateQuizAvailability(id, '"${availability.name}"');
  }

  @override
  Future<void> updateQuizDetails(String id, String title, String description) async {
    return await _quizDetailsClient.updateQuizDetails({
      'id': id,
      'title': title,
      'description': description,
    });
  }

  @override
  Future<void> deleteQuestion(String id) async {
    return await _quizDetailsClient.deleteQuestion(id);
  }
}

final quizDetailsRepositoryProvider = Provider<QuizDetailsRepository>(
  (ref) => QuizDetailsRepositoryImpl(ref.read(quizDetailsClientProvider)),
);