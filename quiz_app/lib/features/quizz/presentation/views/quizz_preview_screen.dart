import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/quizz_summary.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class QuizzPreviewScreen extends StatelessWidget {
  const QuizzPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
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
          ],
        ),
      ),
    );
  }
}
