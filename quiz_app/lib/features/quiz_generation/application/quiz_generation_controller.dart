import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
import '../data/repositories/quiz_generation_repository.dart';
import '../domain/create_quiz_model.dart';
import '../domain/generate_question_model.dart';
import '../domain/generate_quiz_model.dart';
import '../domain/quiz_request_model.dart';
import '../widgets/question_count_picker.dart';
import 'quiz_generation_state.dart';

part 'quiz_generation_controller.g.dart';

@riverpod
class QuizGenerationController extends _$QuizGenerationController {
  late QuizRequestModel _requestModel;
  late GenerateQuizModel _quiz;

  @override
  QuizGenerationState build() {
    _requestModel = QuizRequestModel(
      content: '',
      questionTypes: [],
      numberOfQuestions: QuestionNumberSelection.low.value,
      attachments: [],
    );
    _quiz = const GenerateQuizModel(title: '', description: '', generateQuestions: []);
    return const QuizGenerationState.generating();
  }

  String get content => _requestModel.content;
  List<String> get typeOfQuestions => _requestModel.questionTypes;
  int get numberOfQuestions => _requestModel.numberOfQuestions;
  List<MultipartFile> get attachments => _requestModel.attachments;

  String get title => _quiz.title;
  String get description => _quiz.description;
  List<GenerateQuestionModel> get questions => _quiz.generateQuestions;

  void setContent(String content) {
    _requestModel = _requestModel.copyWith(content: content);
  }

  void addTypeOfQuestions(String typeOfQuestions) {
    _requestModel = _requestModel.copyWith(questionTypes: [..._requestModel.questionTypes, typeOfQuestions]);
  }

  void removeTypeOfQuestions(String typeOfQuestions) {
    final questionTypes = List<String>.from(_requestModel.questionTypes);
    questionTypes.remove(typeOfQuestions);
    _requestModel = _requestModel.copyWith(questionTypes: questionTypes);
  }

  void setNumberOfQuestions(int numberOfQuestions) {
    _requestModel = _requestModel.copyWith(numberOfQuestions: numberOfQuestions);
  }

  void addAttachment(MultipartFile attachment) {
    _requestModel = _requestModel.copyWith(attachments: [..._requestModel.attachments, attachment]);
  }

  void addNewQuestion(GenerateQuestionModel question) {
    _quiz = _quiz.copyWith(generateQuestions: [..._quiz.generateQuestions, question]);
    state = QuizGenerationState.generated(_quiz);
  }

  bool validate() {
    if (_requestModel.content.isEmpty) {
      return false;
    }
    if (_requestModel.questionTypes.isEmpty) {
      return false;
    }
    if (_requestModel.numberOfQuestions == 0) {
      return false;
    }
    return true;
  }

  Future<void> generate() async {
    state = const QuizGenerationState.generating();

    final result = await ref.read(quizGenerationRepositoryProvider).generateQuiz(quizRequestModel: _requestModel);

    _requestModel = _requestModel.copyWith(content: '', questionTypes: [], numberOfQuestions: QuestionNumberSelection.low.value);

    result.fold(
      (error) {
        state = QuizGenerationState.error(S.current.somethingWentWrong);
      },
      (quiz) {
        state = QuizGenerationState.generated(quiz);
        _quiz = quiz;
      },
    );
  }

  Future<void> createQuiz() async {
    final createQuizModel = CreateQuizModel.fromGenerateQuizModel(
      title: _quiz.title,
      description: _quiz.description,
      generateQuizQuestions: _quiz.generateQuestions,
    );
    final result = await ref.read(quizGenerationRepositoryProvider).createQuiz(quizModel: createQuizModel);

    result.fold(
      (error) {
        state = QuizGenerationState.error(S.current.somethingWentWrong);
      },
      (quizID) {
        state = QuizGenerationState.created(quizID);
      },
    );
  }

  Future<void> deleteQuestion(int index) async {
    final questionListCopy = List<GenerateQuestionModel>.from(_quiz.generateQuestions);
    questionListCopy.removeAt(index);
    _quiz = _quiz.copyWith(generateQuestions: questionListCopy);
    state = QuizGenerationState.generated(_quiz);
  }
}
