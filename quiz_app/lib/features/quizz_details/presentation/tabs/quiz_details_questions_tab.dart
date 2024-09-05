import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/common/widgets/question_box.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../quiz_generation/domain/question_model.dart';
import '../../../../core/common/widgets/new_question/add_new_question_bottom_sheet.dart';
import '../../application/quiz_details_controller.dart';
import '../../application/quiz_details_state.dart';
import '../widgets/switch_button.dart';
import '../../../../generated/l10n.dart';

class QuizDetailsQuestionsTab extends ConsumerWidget {
  const QuizDetailsQuestionsTab({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizDetailsControllerProvider);
    final controller = ref.read(quizDetailsControllerProvider.notifier);
    return Column(
      children: [
        questionsHeader(context, state, controller),
        questionsList(context, state),
      ],
    );
  }

  Widget questionsHeader(BuildContext context, QuizDetailsState state, QuizDetailsController controller) {
    return Column(
      children: [
        const MediumVSpacer(),
        Text(
          S.of(context).quizzDetailsTabQuestionsSubheading,
          style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
        ),
        const MediumVSpacer(),
        answersSwitchRow(context, state, controller),
        //const MediumVSpacer(),
        newQuestionButton(context),
      ],
    );
  }

  Widget questionsList(BuildContext context, QuizDetailsState state) {
    return state.maybeWhen(
      loaded: (quizDetails, answersVisible) {
        return Column(
          children: [
            const MediumVSpacer(),
            ListView.builder(
              itemCount: quizDetails.questions.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return QuestionBox(
                  questionIndex: index,
                  question: QuestionModel(
                    title: quizDetails.questions[index].title,
                    createAnswersDto: quizDetails.questions[index].answers,
                  ),
                  onDelete: () {
                    //TODO: Implement delete question
                  },
                  correctAnswerVisible: answersVisible,
                );
              },
            ),
            const LargeVSpacer()
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget answersSwitchRow(BuildContext context, QuizDetailsState state, QuizDetailsController controller) {
    return state.maybeWhen(
      loaded: (quizDetails, answersVisible) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuizStatusBadge(
              text: 'Total ${quizDetails.questions.length} questions',
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
                      value: answersVisible,
                      onChanged: (value) {
                        controller.changeAnswerVisibility(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
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
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColorScheme.primary,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
    );
  }
}
