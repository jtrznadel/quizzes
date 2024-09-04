import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../application/quizz_take_controller.dart';
import 'quizz_multiple_answer_card.dart';
import 'quizz_progress_indicator.dart';

enum AnswerIndicators { A, B, C, D }

class QuizzStepContent extends StatelessWidget {
  const QuizzStepContent({super.key, required this.question});

  final QuestionEntity question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          question.question,
          style: context.textTheme.headlineMedium,
        ),
        const ExtraLargeVSpacer(),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(question.answers.length, (index) {
            return QuizzMultipleAnswerCard(
              answer: question.answers[index],
              questionId: question.questionId,
              indicator: AnswerIndicators.values[index],
            );
          }),
        ),
      ],
    );
  }
}
