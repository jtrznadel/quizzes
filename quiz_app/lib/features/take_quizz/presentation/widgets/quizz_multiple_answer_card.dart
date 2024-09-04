import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../application/quizz_take_controller.dart';
import 'quizz_step_content.dart';

class QuizzMultipleAnswerCard extends ConsumerWidget {
  const QuizzMultipleAnswerCard({required this.indicator, required this.questionId, super.key, required this.answer});

  final String answer;
  final String questionId;
  final AnswerIndicators indicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzController = ref.read(quizzTakeControllerProvider.notifier);
    final quizzState = ref.watch(quizzTakeControllerProvider);
    final selectedAnswer = quizzState.maybeWhen(
      loaded: (currentStep, answers) => answers[questionId],
      orElse: () => null,
    );
    final isSelected = answer == selectedAnswer;
    return InkWell(
      onTap: () {
        quizzController.answerQuestion(questionId: questionId, answer: answer);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: context.width / 2,
        height: context.width / 2,
        decoration: BoxDecoration(
          color: isSelected ? AppColorScheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                indicator.toString().split('.').last,
                style: context.textTheme.labelMedium?.copyWith(
                  color: isSelected ? Colors.white : null,
                ),
              ),
            ),
            const ExtraLargeVSpacer(),
            Expanded(
              flex: 8,
              child: Text(
                answer,
                style: isSelected
                    ? context.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      )
                    : context.textTheme.bodyMedium?.copyWith(
                        color: AppColorScheme.textSecondary,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
