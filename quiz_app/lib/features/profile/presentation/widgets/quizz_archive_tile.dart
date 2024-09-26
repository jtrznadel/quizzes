import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/widgets/dotted_border_container.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/enums/participation_status_enum.dart';
import '../../../../core/utils/enums/quizz_score_enum.dart';
import '../../../../generated/l10n.dart';
import '../../domain/archive_models/quizz_archive_model.dart';

class QuizzArchiveTile extends ConsumerWidget {
  const QuizzArchiveTile({super.key, required this.quizz});

  final QuizzArchiveModel quizz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizScore = QuizzScore.getQuizzScore(quizz.quizResult?.scorePercentage ?? 0);
    final participationStatus = ParticipationStatus.getParticipationStatus(quizz.status);
    return InkWell(
      onTap: () {
        ref.read(appRouterProvider).push(ArchiveResultsRoute(archivedQuizz: quizz));
      },
      child: DottedBorderContainer(
        child: Container(
          padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
          color: AppColorScheme.surfaceContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${S.of(context).archiveResultsHeading} ${quizz.quizResult?.scorePercentage.round() ?? 0}%',
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: quizScore.color,
                    ),
                  ),
                  SvgPicture.asset(
                    MediaRes.arrowForward,
                    colorFilter: const ColorFilter.mode(
                      AppColorScheme.textSecondary,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
              Text(
                quizz.quizTitle,
                style: context.textTheme.labelMedium,
              ),
              const SmallVSpacer(),
              Text(
                quizz.quizDescription,
                style: context.textTheme.bodyMedium,
              ),
              const SmallVSpacer(),
              Row(
                children: [
                  Text(
                    DateFormat('dd.MM.yyyy').format(DateTime.parse(quizz.participationDateUtc).toLocal()),
                    style: context.textTheme.bodySmall,
                  ),
                  const SmallHSpacer(),
                  QuizStatusBadge(
                    text: participationStatus.label,
                    backgroundColor: participationStatus.backgroundColor,
                    textColor: participationStatus.textColor,
                  ),
                ],
              ),
              const LargeVSpacer(),
              Row(
                children: [
                  QuizStatusBadge(
                    text: S.of(context).quizQuestionNumberBadge(quizz.quizResult?.totalQuestions ?? 0),
                    backgroundColor: AppColorScheme.secondary,
                    textColor: AppColorScheme.primary,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
