import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/quiz_status_badge.dart';
import 'package:quiz_app/core/common/widgets/spacers/horizontal_spacers.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/dashboard/domain/entities/test_quiz_entity.dart';

class QuizDeleteDialogItem extends StatelessWidget {
  const QuizDeleteDialogItem({super.key, required this.quizEntity});

  final TestQuizEntity quizEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        quizContainer([
          quizHeader(context),
          const SmallVSpacer(),
          quizDescription(context),
        ]),
        const SmallVSpacer(),
        quizStatus(),
      ],
    );
  }

  Widget quizContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppTheme.quizDeleteDialogItemBorderRadius),
          color: AppColorScheme.surfaceContainer),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: AppColorScheme.border,
        strokeWidth: AppTheme.dottedBorderWidth,
        radius:
            const Radius.circular(AppTheme.quizDeleteDialogItemBorderRadius),
        borderPadding: const EdgeInsets.all(0.5),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(AppTheme.quizDeleteDialogItemBorderRadius),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ).addPadding(
            padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
          ),
        ),
      ),
    );
  }

  Widget quizHeader(BuildContext context) {
    return Text(
      quizEntity.quizTitle,
      style: context.theme.textTheme.headlineSmall!.copyWith(
        fontSize: 16,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget quizDescription(BuildContext context) {
    return Text(
      quizEntity.quizDescription,
      style: context.theme.textTheme.bodyMedium!
          .copyWith(color: AppColorScheme.textSecondary),
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
