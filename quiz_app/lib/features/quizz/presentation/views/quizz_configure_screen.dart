import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/question_count_picker.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/question_type_picker.dart';

class QuizzConfigureScreen extends StatelessWidget {
  const QuizzConfigureScreen({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringRes.quizzCreationConfigureHeading,
              style: context.textTheme.headlineLarge,
            ),
            Text(
              StringRes.quizzCraetionConfigureSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            const QuestionTypePicker(),
            const SizedBox(
              height: 24,
            ),
            const QuestionCountPicker(),
            const SizedBox(
              height: 40,
            ),
            BasicButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              text: StringRes.continueButton,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
