import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/l10n.dart';
import '../data/repositories/quiz_generation_repository.dart';
import '../domain/answer_model.dart';
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
    _quiz = const QuizModel(title: '', description: '', generateQuestionsDto: []);
    return const QuizGenerationState.generating();
  }

  String get content => _quizModel.content;
  String get typeOfQuestions => _quizModel.questionType;
  int get numberOfQuestions => _quizModel.numberOfQuestions;

  String get title => _quiz.title;
  String get description => _quiz.description;
  List<QuestionModel> get questions => _quiz.generateQuestionsDto;

  void setContent(String content) {
    _quizModel = _quizModel.copyWith(content: content);
  }

  void setTypeOfQuestions(String typeOfQuestions) {
    _quizModel = _quizModel.copyWith(questionType: typeOfQuestions);
  }

  void setNumberOfQuestions(int numberOfQuestions) {
    _quizModel = _quizModel.copyWith(numberOfQuestions: numberOfQuestions);
  }

  void addNewQuestion(QuestionModel question){
    _quiz = _quiz.copyWith(generateQuestionsDto: [..._quiz.generateQuestionsDto, question]);
    state = QuizGenerationState.generated(_quiz);
  }

  Map<String, dynamic> quizToJson(){
    return {
      'title': _quiz.title,
      'description': _quiz.description,
      'createQuestionsDto': [
        for (var question in _quiz.generateQuestionsDto)
          {
            'title': question.title,
            'createAnswersDto': [
              for (var answer in question.generateAnswersDto)
                {
                  'content': answer.content,
                  'iscorrect': answer.iscorrect,
                }
            ],
          }
      ],
    };
  }


  Future<void> generate() async {
    state = const QuizGenerationState.generating();

    ////TODO: remove after testing
    //_quiz = mockQuiz;
    //state = QuizGenerationState.generated(mockQuiz);
    //return;

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
}


QuizModel mockQuiz = QuizModel(
  title: S.current.tempQuizzSummaryTitle,
  description: S.current.tempQuizzSummaryDescription,
  generateQuestionsDto: [
    QuestionModel(
      title: S.current.tempQuestion,
      generateAnswersDto: [
        AnswerModel(
          content: S.current.tempAnswer1,
          iscorrect: false,
        ),
        AnswerModel(
          content: S.current.tempAnswer2,
          iscorrect: true,
        ),
        AnswerModel(
          content: S.current.tempAnswer3,
          iscorrect: false,
        ),
        AnswerModel(
          content: S.current.tempAnswer4,
          iscorrect: false,
        ),
      ],
    ),
    QuestionModel(
      title: S.current.tempQuestion,
      generateAnswersDto: [
        AnswerModel(
          content: S.current.tempAnswer1,
          iscorrect: false,
        ),
        AnswerModel(
          content: S.current.tempAnswer2,
          iscorrect: true,
        ),
        AnswerModel(
          content: S.current.tempAnswer3,
          iscorrect: false,
        ),
        AnswerModel(
          content: S.current.tempAnswer4,
          iscorrect: false,
        ),
      ],
    ),
  ],
);