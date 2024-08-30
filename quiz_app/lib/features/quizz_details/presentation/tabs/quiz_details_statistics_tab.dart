import 'package:flutter/material.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../widgets/quiz_attempt_item.dart';
import '../../../../generated/l10n.dart';

class QuizDetailsStatisticsTab extends StatelessWidget {
  const QuizDetailsStatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MediumVSpacer(),
        statisticsHeader(context),
        const MediumVSpacer(),
        statisticsList(context),
      ],
    );
  }

  Widget statisticsHeader(BuildContext context) {
    return Text(
      S.of(context).quizzDetailsTabStatisticsSubheading,
      style: context.textTheme.bodyMedium!
          .copyWith(color: AppColorScheme.textSecondary),
    );
  }

  Widget statisticsList(context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const Column(
              children: [
                QuizAttemptItem(),
                MediumVSpacer(),
              ],
            );
          },
        ),
      ],
    );
  }
}
