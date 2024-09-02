import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/quiz_details_repository.dart';
import 'quiz_details_state.dart';

part 'quiz_details_controller.g.dart';

@riverpod
class QuizDetailsController extends _$QuizDetailsController {

  @override
  QuizDetailsState build() => const QuizDetailsState.loading();

  Future<void> getQuizDetails(String id) async {
    state = const QuizDetailsState.loading();

    final QuizDetailsRepository quizDetailsRepository = ref.read(quizDetailsRepositoryProvider);

    try {
      final quizDetails = await quizDetailsRepository.getQuizDetails(id);
      state = QuizDetailsState.loaded(quizDetails);
    } catch (e) {
      state = QuizDetailsState.error(e.toString());
    }
  }
}