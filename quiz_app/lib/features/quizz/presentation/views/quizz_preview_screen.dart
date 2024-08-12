import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/question_box.dart';
import 'package:quiz_app/core/common/widgets/quizz_summary.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class QuizzPreviewScreen extends StatelessWidget {
  const QuizzPreviewScreen({super.key});

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
              StringRes.quizzCreationPreviewHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            const QuizzSummary(
              title: StringRes.tempQuizzSummaryTitle,
              description: StringRes.tempQuizzSummaryDescription,
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SecondaryButton(
                onPressed: () {},
                text: 'New question',
                width: context.width / 2,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //TODO: Remove loop and implement a listview.builder with question model
            for (int i = 0; i < 3; i++) ...[
              const QuestionBox(),
              const SizedBox(
                height: 32,
              ),
            ],
            BasicButton(
              onPressed: () {},
              text: 'Save Quizz',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
