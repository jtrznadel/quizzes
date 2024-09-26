import 'package:flutter/material.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/theme/app_color_scheme.dart';

class QuizAttemptItem extends StatelessWidget {
  const QuizAttemptItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.quizAttemptItemBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          statusBadges(context),
          const SmallVSpacer(),
          InfoRow(
            label: S.of(context).quizzDetailsTabStatisticsScore,
            value: '40',
          ),
          const SmallVSpacer(),
          InfoRow(
            label: S.of(context).quizzDetailsTabStatisticsName,
            value: 'John B',
          ),
          const SmallVSpacer(),
          InfoRow(
            label: S.of(context).quizzDetailsTabStatisticsEmail,
            value: '-',
          ),
          const SmallVSpacer(),
          InfoRow(
            label: S.of(context).quizzDetailsTabStatisticsTime,
            value: S.of(context).quizzDetailsTabStatisticsSecondsElapsed(12),
          ),
          const SmallVSpacer(),
          InfoRow(
            label: S.of(context).quizzDetailsTabStatisticsDate,
            value: '21.08.2024',
          ),
        ],
      ).addPadding(padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize)),
    );
  }

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
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.textTheme.bodyMedium),
        Text(value, style: context.textTheme.headlineSmall),
      ],
    );
  }
}
