import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/question_count_picker.dart';
import 'package:quiz_app/generated/l10n.dart';

import 'package:quiz_app/features/quizz/presentation/widgets/question_type_picker.dart';

class QuizzConfigureScreen extends StatelessWidget {
  const QuizzConfigureScreen({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(top: 0), //TODO: Remove top padding if needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).quizzCreationConfigureHeading,
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    S.of(context).quizzCraetionConfigureSubheading,
                    style: context.textTheme.bodyMedium,
                  ),
                  const ExtraLargeVSpacer(),
                  const QuestionTypePicker(),
                  const LargeVSpacer(),
                  const QuestionCountPicker(),
                  const ExtraLargeVSpacer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              color: AppColorScheme.surface,
              padding: const EdgeInsets.only(top: 8),
              child: BasicButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                text: S.of(context).continueButton,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
