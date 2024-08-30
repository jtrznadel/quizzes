import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/common/widgets/question_box.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../quiz_generation/domain/answer_model.dart';
import '../../../quiz_generation/domain/question_model.dart';
import '../widgets/add_new_question_bottom_sheet.dart';
import '../widgets/switch_button.dart';
import '../../../../generated/l10n.dart';

class QuizDetailsQuestionsTab extends StatefulWidget {
  const QuizDetailsQuestionsTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizDetailsQuestionsTabState();
  }
}

class _QuizDetailsQuestionsTabState extends State<QuizDetailsQuestionsTab> {
  bool _answersVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        questionsHeader(context),
        questionsList(context),
      ],
    );
  }

  Widget questionsHeader(BuildContext context) {
    return Column(
      children: [
        const MediumVSpacer(),
        Text(
          S.of(context).quizzDetailsTabQuestionsSubheading,
          style: context.textTheme.bodyMedium!
              .copyWith(color: AppColorScheme.textSecondary),
        ),
        const MediumVSpacer(),
        answersSwitchRow(context),
        //const MediumVSpacer(),
        newQuestionButton(context),
      ],
    );
  }

  Widget questionsList(BuildContext context) {
    return Column(
      children: [
        const MediumVSpacer(),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return QuestionBox(
              questionIndex: index,
              question: QuestionModel(
                title: "Question $index",
                generateAnswersDto: generateAnswersDto,
              ),
            );
          },
        ),
        const LargeVSpacer()
      ],
    );
  }

  Widget answersSwitchRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const QuizStatusBadge(
          text: "Total 10 questions",
          backgroundColor: AppColorScheme.secondary,
          textColor: AppColorScheme.primary,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).quizzDetailsTabQuestionsSwitch,
              style: context.textTheme.bodyMedium,
            ),
            const ExtraSmallHSpacer(),
            SizedBox(
              height: 32,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SwitchButton(
                  value: _answersVisible,
                  onChanged: (value) {
                    setState(() {
                      _answersVisible = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget newQuestionButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          AddNewQuestionBottomSheet.show(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          S.of(context).quizzDetailsTabQuestionsAddNewQuestion,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColorScheme.primary,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
    );
  }

  //TODO: Remove this method after implementing the real data
  List<AnswerModel> get generateAnswersDto => [
        const AnswerModel(
          content: "Answer A",
          isCorrect: true,
        ),
        const AnswerModel(
          content: "Answer B",
          isCorrect: false,
        ),
        const AnswerModel(
          content: "Answer C",
          isCorrect: false,
        ),
        const AnswerModel(
          content: "Answer D",
          isCorrect: false,
        ),
      ];
}
