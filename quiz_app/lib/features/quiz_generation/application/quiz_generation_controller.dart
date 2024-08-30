import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/quiz_generation_repository.dart';
import '../domain/question_model.dart';
import '../domain/quiz_generation_model.dart';
import '../domain/quiz_model.dart';
import '../widgets/question_count_picker.dart';
import '../widgets/question_type_picker.dart';
import 'quiz_generation_state.dart';

part 'quiz_generation_controller.g.dart';

@riverpod
class QuizGenerationController extends _$QuizGenerationController {
  late QuizGenerationModel _quizModel;
  late QuizModel _quiz;

  @override
  QuizGenerationState build() {
    _quizModel = QuizGenerationModel(
      content: '',
      questionType: QuestionType.MultipleChoice.name,
      numberOfQuestions: QuestionNumberSelection.low.value,
    );
    _quiz =
        const QuizModel(title: '', description: '', createQuestionsDto: []);
    return const QuizGenerationState.generating();
  }

  String get content => _quizModel.content;
  String get typeOfQuestions => _quizModel.questionType;
  int get numberOfQuestions => _quizModel.numberOfQuestions;

  String get title => _quiz.title;
  String get description => _quiz.description;
  List<QuestionModel> get questions => _quiz.createQuestionsDto;

  void setContent(String content) {
    _quizModel = _quizModel.copyWith(content: content);
  }

  void setTypeOfQuestions(String typeOfQuestions) {
    _quizModel = _quizModel.copyWith(questionType: typeOfQuestions);
  }

  void setNumberOfQuestions(int numberOfQuestions) {
    _quizModel = _quizModel.copyWith(numberOfQuestions: numberOfQuestions);
  }

  void addNewQuestion(QuestionModel question) {
    _quiz = _quiz.copyWith(
        createQuestionsDto: [..._quiz.createQuestionsDto, question]);
    state = QuizGenerationState.generated(_quiz);
  }

  Future<void> generate() async {
    state = const QuizGenerationState.generating();

    final result = await ref
        .read(quizGenerationRepositoryProvider)
        .generateQuiz(quizGenerationModel: _quizModel);

    result.fold(
      (error) {
        //TODO: replace with translation
        state = const QuizGenerationState.error('Something went wrong');
      },
      (quiz) {
        state = QuizGenerationState.generated(quiz);
        _quiz = quiz;
      },
    );
  }

  Future<void> createQuiz() async {
    final result = await ref
        .read(quizGenerationRepositoryProvider)
        .createQuiz(quizModel: _quiz);

    result.fold(
      (error) {
        state = const QuizGenerationState.error('Something went wrong');
      },
      (quizID) {
        state = QuizGenerationState.created(quizID);
      },
    );
  }

  Future<void> deleteQuestion(int index) async {
    final questionListCopy = List<QuestionModel>.from(_quiz.createQuestionsDto);
    questionListCopy.removeAt(index);
    _quiz = _quiz.copyWith(createQuestionsDto: questionListCopy);
    state = QuizGenerationState.generated(_quiz);
  }
}
