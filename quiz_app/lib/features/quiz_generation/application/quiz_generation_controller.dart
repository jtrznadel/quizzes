import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
import '../data/repositories/quiz_generation_repository.dart';
import '../domain/create_quiz_model.dart';
import '../domain/generate_question_model.dart';
import '../domain/generate_quiz_model.dart';
import '../domain/quiz_request_model.dart';
import 'quiz_generation_state.dart';

part 'quiz_generation_controller.g.dart';

@riverpod
class QuizGenerationController extends _$QuizGenerationController {

  late final QuizGenerationRepository _quizGenerationRepository;

  @override
  QuizGenerationState build() {
    const requestModel = QuizRequestModel(
      content: '',
      questionTypes: [],
      numberOfQuestions: 5,
      attachments: [],
    );
    _quizGenerationRepository = ref.read(quizGenerationRepositoryProvider);
    return const QuizGenerationState.generating(requestModel);
  }

  void modifyRequest(QuizRequestModel requestModel) {
    state = QuizGenerationState.generating(requestModel);
  }

  void modifyGeneratedQuiz(GenerateQuizModel quiz) {
    state = QuizGenerationState.generated(quiz);
  }

  bool validate(QuizRequestModel requestModel) {
    if (requestModel.content.isEmpty && requestModel.attachments.isEmpty) {
      return false;
    }
    if (requestModel.questionTypes.isEmpty) {
      return false;
    }
    if (requestModel.numberOfQuestions == 0) {
      return false;
    }
    return true;
  }

  Future<void> generate(QuizRequestModel requestModel) async {
    final result = await _quizGenerationRepository.generateQuiz(quizRequestModel: requestModel);

    result.fold(
      (error) {
        state = QuizGenerationState.error(S.current.somethingWentWrong);
      },
      (quiz) {
        state = QuizGenerationState.generated(quiz);
      },
    );
  }

  Future<void> createQuiz(CreateQuizModel quiz) async {
    final result = await _quizGenerationRepository.createQuiz(quizModel: quiz);

    result.fold(
      (error) {
        state = QuizGenerationState.error(S.current.somethingWentWrong);
      },
      (quizID) {
        state = QuizGenerationState.created(quizID);
      },
    );
  }

  void resetState() {
    state = const QuizGenerationState.generating(QuizRequestModel(
      content: '',
      questionTypes: [],
      numberOfQuestions: 5,
      attachments: [],
    ));
  }

  Future<void> deleteQuestion(GenerateQuizModel quiz, int index) async {
    final questionListCopy = List<GenerateQuestionModel>.from(quiz.generateQuestions);
    questionListCopy.removeAt(index);
    quiz = quiz.copyWith(generateQuestions: questionListCopy);
    state = QuizGenerationState.generated(quiz);
  }
}
