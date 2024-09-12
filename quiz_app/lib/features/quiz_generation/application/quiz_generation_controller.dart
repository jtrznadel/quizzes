import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/file_reader.dart';
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

  void modifyRequest(QuizRequestModel requestModel) {
    state = QuizGenerationState.generating(requestModel);
  }

  void modifyGeneratedQuiz(GenerateQuizModel quiz) {
    state = QuizGenerationState.generated(quiz);
  }

  bool validate(QuizRequestModel requestModel) {
    return requestModel.content.isNotEmpty && requestModel.questionTypes.isNotEmpty && requestModel.numberOfQuestions > 0;
  }

  void setContent(String content) {
    state.maybeWhen(
      generating: (request) {
        request = request.copyWith(content: content);
        modifyRequest(request);
      },
      orElse: () {},
    );
  }

  void addAttachment(PlatformFile file) {
    state.maybeWhen(
      generating: (request) {
        request = request.copyWith(attachments: [...request.attachments, FileReader.toMultipartFile(file)]);
        modifyRequest(request);
      },
      orElse: () {},
    );
  }

  List<MultipartFile> getAttachments() {
    return state.maybeWhen(
      generating: (request) => request.attachments,
      orElse: () => const [],
    );
  }
}
