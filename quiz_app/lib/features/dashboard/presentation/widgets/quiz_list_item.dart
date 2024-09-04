import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/test_quiz_entity.dart';
import 'delete_quiz_dialog.dart';

class QuizListItem extends ConsumerWidget {
  const QuizListItem({super.key, required this.quizEntity});

  final TestQuizEntity quizEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(appRouterProvider).push(const QuizzDetailsRoute());
      },
      child: quizContainer(
        [
          quizHeader(context),
          const SmallVSpacer(),
          quizDescription(context),
          const LargeVSpacer(),
          quizStatus(),
        ],
      ),
    );
  }

  Widget quizContainer(List<Widget> children) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppTheme.quizListItemBorderRadius), color: AppColorScheme.surfaceContainer),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: AppColorScheme.border,
        strokeWidth: AppTheme.dottedBorderWidth,
        radius: const Radius.circular(AppTheme.quizListItemBorderRadius),
        borderPadding: const EdgeInsets.all(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.quizListItemBorderRadius),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: children)
              .addPadding(
            padding: const EdgeInsets.all(AppTheme.quizListItemPadding),
          ),
        ),
      ),
    );
  }

  Widget quizHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(quizEntity.quizTitle,
              style: context.theme.textTheme.headlineSmall?.copyWith(
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              DeleteQuizDialog.show(context, quizEntity);
            },
            splashColor: AppColorScheme.textPrimary.withOpacity(0.1),
            splashFactory: InkRipple.splashFactory,
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              MediaRes.deleteQuiz,
              width: AppTheme.quizListItemDeleteIconSize,
              height: AppTheme.quizListItemDeleteIconSize,
            ).addPadding(padding: const EdgeInsets.all(AppTheme.quizListItemIconPadding)),
          ),
        ),
      ],
    );
  }

  Widget quizDescription(BuildContext context) {
    return Text(
      quizEntity.quizDescription,
      style: context.theme.textTheme.bodyMedium?.copyWith(color: AppColorScheme.textSecondary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget quizStatus() {
    return Row(
      children: [
        QuizStatusBadge(
          text: 'Total ${quizEntity.quizNumberOfQuestions} questions',
          backgroundColor: AppColorScheme.secondary,
          textColor: AppColorScheme.primary,
        ),
        const MediumHSpacer(),
        QuizStatusBadge(
          text: quizEntity.quizStatus,
          backgroundColor: AppColorScheme.successLight,
          textColor: AppColorScheme.success,
        ),
      ],
    );
  }
}
