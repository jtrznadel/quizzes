import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/quiz_details_repository.dart';
import '../domain/quiz_details_model.dart';
import 'quiz_details_state.dart';

part 'quiz_details_controller.g.dart';

@riverpod
class QuizDetailsController extends _$QuizDetailsController {

  QuizStatus tempStatus = QuizStatus.Active;
  QuizAvailability tempAvailability = QuizAvailability.Public;

  @override
  QuizDetailsState build() => const QuizDetailsState.loading();

  Future<void> getQuizDetails(String id) async {
    state = const QuizDetailsState.loading();

    final QuizDetailsRepository quizDetailsRepository = ref.read(quizDetailsRepositoryProvider);

    try {
      final quizDetails = await quizDetailsRepository.getQuizDetails(id);
      tempStatus = quizDetails.status;
      tempAvailability = quizDetails.availability;
      state = QuizDetailsState.loaded(quizDetails);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }

  Future<void> updateQuizStatus(String id) async {
    final QuizDetailsRepository quizDetailsRepository = ref.read(quizDetailsRepositoryProvider);

    try {
      await quizDetailsRepository.updateQuizStatus(id, tempStatus);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }

  Future<void> updateQuizAvailability(String id) async {
    final QuizDetailsRepository quizDetailsRepository = ref.read(quizDetailsRepositoryProvider);

    try {
      await quizDetailsRepository.updateQuizAvailability(id, tempAvailability);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }

  Future<void> updateQuizDetails(String id, String title, String description) async {
    final QuizDetailsRepository quizDetailsRepository = ref.read(quizDetailsRepositoryProvider);

    try {
      await quizDetailsRepository.updateQuizDetails(id, title, description);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }
}