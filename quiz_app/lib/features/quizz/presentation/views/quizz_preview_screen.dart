import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/question_box.dart';
import 'package:quiz_app/core/common/widgets/quizz_summary.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_bottom_sheet.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuizzPreviewScreen extends StatelessWidget {
  const QuizzPreviewScreen({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quizzCreationPreviewHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            QuizzSummary(
              title: S.of(context).tempQuizzSummaryTitle,
              description: S.of(context).tempQuizzSummaryDescription,
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SecondaryButton(
                onPressed: () {
                  AddNewQuestionBottomSheet.show(context);
                },
                text: S.of(context).quizzCreationAddQuestionButton,
                width: context.width / 2,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //TODO: Remove loop and implement a listview.builder with question model
            for (int i = 0; i < 3; i++) ...[
              QuestionBox(
                questionNumber: i + 1,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
            BasicButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              text: 'Save Quizz',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
