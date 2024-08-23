import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/question_box.dart';
import '../../../../core/common/widgets/quizz_summary.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/add_new_question_bottom_sheet.dart';
import '../../../../generated/l10n.dart';

class QuizzPreviewScreen extends StatelessWidget {
  const QuizzPreviewScreen({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(top: 0), //TODO: Remove top padding if needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).quizzCreationPreviewHeading,
                    style: context.textTheme.headlineLarge,
                  ),
                  const LargeVSpacer(),
                  QuizzSummary(
                    title: S.of(context).tempQuizzSummaryTitle,
                    description: S.of(context).tempQuizzSummaryDescription,
                  ),
                  const ExtraLargeVSpacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SecondaryButton(
                      onPressed: () {
                        AddNewQuestionBottomSheet.show(context);
                      },
                      text: S.of(context).quizzCreationAddQuestionButton,
                    ),
                  ),
                  const LargeVSpacer(),
                  //TODO: Remove loop and implement a listview.builder with question model
                  for (int i = 0; i < 3; i++) ...[
                    QuestionBox(
                      questionNumber: i + 1,
                    ),
                    const CustomVSpacer(32),
                  ],
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
                text: S.of(context).saveQuizzButton,
              ),
            ),
          )
        ],
      ),
    );
  }
}
