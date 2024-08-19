import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';

class QuizAttemptItem extends StatelessWidget {
  const QuizAttemptItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          statusBadges(context),
          infoRow(
            StringRes.quizzDetailsTabStatisticsScore,
            '40',
            context,
          ),
          infoRow(
            StringRes.quizzDetailsTabStatisticsName,
            'John B',
            context,
          ),
          infoRow(
            StringRes.quizzDetailsTabStatisticsEmail,
            '-',
            context,
          ),
          infoRow(
            StringRes.quizzDetailsTabStatisticsTime,
            '12 seconds',
            context,
          ),
          infoRow(
            StringRes.quizzDetailsTabStatisticsDate,
            '21.08.2024',
            context,
          ),
        ],
      ).addPadding(padding: const EdgeInsets.all(16)),
    );
  }

  //TODO: replace with status badges from dashboard
  Widget statusBadges(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringRes.quizzDetailsTabStatisticsDetailsStatusBadge,
          style: context.textTheme.labelMedium,
        ),
        Text(
          StringRes.quizzDetailsTabStatisticsFinishedStatusBadge,
          style: context.textTheme.labelMedium,
        )
      ],
    );
  }

  Widget infoRow(String label, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.textTheme.bodyMedium),
        Text(value, style: context.textTheme.headlineSmall),
      ],
    ).addPadding(padding: const EdgeInsets.only(top: 8));
  }
}
