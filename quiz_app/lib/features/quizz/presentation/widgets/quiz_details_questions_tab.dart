import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/common/widgets/question_box.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_bottom_sheet.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/quiz_details_answers_switch.dart';

class QuizDetailsQuestionsTab extends StatefulWidget {
  const QuizDetailsQuestionsTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizDetailsQuestionsTabState();
  }
}

class _QuizDetailsQuestionsTabState extends State<QuizDetailsQuestionsTab> {
  bool answersVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              questionsHeader(context),
              Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const QuestionBox().addPadding(
                          padding: const EdgeInsets.only(bottom: 32));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget questionsHeader(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColorScheme.surface,
          child: Text(
            StringRes.quizzDetailsTabQuestionsSubheading,
            style: context.textTheme.bodyMedium!
                .copyWith(color: AppColorScheme.textSecondary),
          ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
        ),
        Material(
          color: AppColorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  "Total questions: 10",), //TODO: replace with status badge from the dashboard quiz card
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(StringRes.quizzDetailsTabQuestionsSwitch,
                          style: context.textTheme.bodyMedium)
                      .addPadding(padding: const EdgeInsets.only(right: 4)),
                  SizedBox(
                    height: 32,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: QuizDetailsAnswersSwitch(value: answersVisible, onChanged: (value){
                        setState(() {
                          answersVisible = value;
                        });
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Material(
          color: AppColorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
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
                  StringRes.quizzDetailsTabQuestionsAddNewQuestion,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              )
            ],
          ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
        ),
      ],
    );
  }
}
