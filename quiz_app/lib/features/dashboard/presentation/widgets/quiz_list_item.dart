import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/quiz_status_badge.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/dashboard/domain/entities/test_quiz_entity.dart';

class QuizListItem extends StatelessWidget {
  const QuizListItem({super.key, required this.quizEntity});

  final TestQuizEntity quizEntity;

  @override
  Widget build(BuildContext context) {
    return quizContainer(
      [
        quizHeader(context),
        quizDescription(context),
        quizStatus(),
      ],
    );
  }

  Widget quizContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColorScheme.surfaceContainer),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: AppColorScheme.border,
        strokeWidth: 1.5,
        radius: const Radius.circular(8),
        borderPadding: const EdgeInsets.all(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children)
              .addPadding(
            padding: const EdgeInsets.all(24),
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
              style: context.theme.textTheme.headlineSmall!.copyWith(
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              //TODO: Delete quiz
            },
            splashColor: AppColorScheme.textPrimary.withOpacity(0.1),
            splashFactory: InkRipple.splashFactory,
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              MediaRes.deleteQuiz,
              width: 24,
              height: 24,
            ).addPadding(padding: const EdgeInsets.all(4)),
          ),
        ),
      ],
    ).addPadding(
      padding: const EdgeInsets.only(bottom: 8),
    );
  }

  Widget quizDescription(BuildContext context) {
    return Text(
      quizEntity.quizDescription,
      style: context.theme.textTheme.bodyMedium!
          .copyWith(color: AppColorScheme.textSecondary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ).addPadding(
      padding: const EdgeInsets.only(bottom: 32),
    );
  }

  Widget quizStatus() {
    return Row(
      children: [
        QuizStatusBadge(
          text: 'Total ${quizEntity.quizNumberOfQuestions} questions',
          backgroundColor: AppColorScheme.secondary,
          textColor: AppColorScheme.primary,
        ).addPadding(padding: const EdgeInsets.only(right: 16)),
        QuizStatusBadge(
          text: quizEntity.quizStatus,
          backgroundColor: AppColorScheme.successLight,
          textColor: AppColorScheme.success,
        ),
      ],
    );
  }
}
