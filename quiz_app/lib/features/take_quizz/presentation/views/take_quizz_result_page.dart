import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/widgets/answer_tile.dart';
import '../../../../core/common/widgets/dotted_border_container.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/enums/answer_indicator_enum.dart';
import '../../../../core/utils/enums/answer_result_enum.dart';
import '../../../quizz_details/domain/answer_details_model.dart';
import '../../../quizz_details/domain/question_details_model.dart';
import '../../../quizz_details/domain/quiz_details_model.dart';
import '../../domain/quiz_result_model.dart';
import '../../domain/user_answer_model.dart';

@RoutePage()
class TakeQuizzResultPage extends StatelessWidget {
  const TakeQuizzResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizResultModel mockResult = const QuizResultModel(
        quizParticipationId: '432423',
        quizDetails: QuizDetailsModel(
          id: '312312',
          title: 'TEst',
          description: '423423',
          shareLink: '423423',
          availability: QuizAvailability.Public,
          status: QuizStatus.Active,
          questions: [
            QuestionDetailsModel(
              id: '1a',
              title: 'Temporary Question 1',
              answers: [
                AnswerDetailsModel(id: '1aa', content: 'Answer 1aa', isCorrect: false),
                AnswerDetailsModel(id: '1ab', content: 'Answer 2ab', isCorrect: false),
                AnswerDetailsModel(id: '1ac', content: 'Answer 3ac', isCorrect: true),
                AnswerDetailsModel(id: '1ad', content: 'Answer 4ad', isCorrect: false),
              ],
            ),
            QuestionDetailsModel(
              id: '2a',
              title: 'Temporary Question 2',
              answers: [
                AnswerDetailsModel(id: '2aa', content: 'Answer 1aa', isCorrect: false),
                AnswerDetailsModel(id: '2ab', content: 'Answer 2ab', isCorrect: false),
                AnswerDetailsModel(id: '2ac', content: 'Answer 3ac', isCorrect: false),
                AnswerDetailsModel(id: '2ad', content: 'Answer 4ad', isCorrect: true),
              ],
            ),
            QuestionDetailsModel(
              id: '3a',
              title: 'Temporary Question 3',
              answers: [
                AnswerDetailsModel(id: '3aa', content: 'Answer 1aa', isCorrect: false),
                AnswerDetailsModel(id: '3ab', content: 'Answer 2ab', isCorrect: true),
                AnswerDetailsModel(id: '3ac', content: 'Answer 3ac', isCorrect: false),
                AnswerDetailsModel(id: '3ad', content: 'Answer 4ad', isCorrect: false),
              ],
            ),
          ],
        ),
        userAnswers: [
          UserAnswerModel(questionId: '1a', answerId: '1ab'),
          UserAnswerModel(questionId: '2a', answerId: '2aa'),
          UserAnswerModel(questionId: '3a', answerId: '3ab'),
        ],
        totalQuestions: 3,
        correctAnswers: 3,
        scorePercentage: 100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text('Your result is: 1/5'),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: mockResult.quizDetails.questions.length,
                itemBuilder: (context, index) {
                  return QuestionResultBox(
                    questionModel: mockResult.quizDetails.questions[index],
                    userAnswerId: mockResult.userAnswers
                        .where((element) => element.questionId == mockResult.quizDetails.questions[index].id)
                        .first
                        .answerId,
                    correctAnswerId: mockResult.quizDetails.questions[index].answers.where((element) => element.isCorrect).first.id,
                  );
                },
                separatorBuilder: (context, index) {
                  return const LargeVSpacer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionResultBox extends StatelessWidget {
  const QuestionResultBox({
    super.key,
    required this.questionModel,
    required this.correctAnswerId,
    required this.userAnswerId,
  });

  final QuestionDetailsModel questionModel;
  final String correctAnswerId;
  final String userAnswerId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorScheme.questionBoxContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DottedBorderContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionModel.title,
                style: context.textTheme.labelMedium,
              ),
              const MediumVSpacer(),
              ListView.separated(
                itemCount: questionModel.answers.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final answer = questionModel.answers[index];
                  final answerResult = getAnswerState(answer.id, correctAnswerId, userAnswerId);
                  return AnswerTile(
                    leading: AnswerIndicators.values[index].name,
                    text: questionModel.answers[index].content,
                    result: answerResult,
                    trailing: answerResult.getAnswerIcon(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SmallVSpacer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
