import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/quiz_status_badge.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/generated/l10n.dart';

import '../../../../core/theme/app_color_scheme.dart';

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
            S.of(context).quizzDetailsTabStatisticsScore,
            '40',
            context,
          ),
          infoRow(
            S.of(context).quizzDetailsTabStatisticsName,
            'John B',
            context,
          ),
          infoRow(
            S.of(context).quizzDetailsTabStatisticsEmail,
            '-',
            context,
          ),
          infoRow(
            S.of(context).quizzDetailsTabStatisticsTime,
            '12 seconds',
            context,
          ),
          infoRow(
            S.of(context).quizzDetailsTabStatisticsDate,
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
        QuizStatusBadge(
          text: S.of(context).quizzDetailsTabStatisticsDetailsStatusBadge,
          backgroundColor: AppColorScheme.secondary,
          textColor: AppColorScheme.primary,
        ),
        QuizStatusBadge(
          text: S.of(context).quizzDetailsTabStatisticsFinishedStatusBadge,
          backgroundColor: AppColorScheme.successLight,
          textColor: AppColorScheme.success,
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
