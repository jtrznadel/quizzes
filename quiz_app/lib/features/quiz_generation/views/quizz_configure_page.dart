import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common/widgets/basic_button.dart';
import '../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/theme/app_color_scheme.dart';
import '../../../core/theme/app_theme.dart';
import '../application/quiz_generation_controller.dart';
import '../widgets/question_count_picker.dart';
import '../../../generated/l10n.dart';

import '../widgets/question_type_picker.dart';

class QuizzConfigurePage extends ConsumerWidget {
  const QuizzConfigurePage({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizGenerationController = ref.read(quizGenerationControllerProvider.notifier);
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
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              color: AppColorScheme.surface,
              padding: const EdgeInsets.only(top: 8),
              child: BasicButton(
                onPressed: () async {
                  try {
                    if (quizGenerationController.validate()) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      await quizGenerationController.generate();
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).quizzCreationConfigurationError,
                            ),
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).somethingWentWrong),
                        ),
                      );
                    }
                  }
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
