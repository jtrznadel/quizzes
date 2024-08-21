import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/quiz_attempt_item.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuizDetailsStatisticsTab extends StatelessWidget {
  const QuizDetailsStatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        statisticsHeader(context),
        statisticsList(context),
      ],
    );
  }

  Widget statisticsHeader(BuildContext context) {
    return Text(
      S.of(context).quizzDetailsTabStatisticsSubheading,
      style: context.textTheme.bodyMedium!
          .copyWith(color: AppColorScheme.textSecondary),
    ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16));
  }

  Widget statisticsList(context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const QuizAttemptItem()
                .addPadding(padding: const EdgeInsets.only(bottom: 16));
          },
        ),
      ],
    );
  }
}
