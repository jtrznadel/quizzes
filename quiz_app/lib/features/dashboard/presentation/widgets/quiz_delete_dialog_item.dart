import 'package:flutter/material.dart';
import '../../../../core/common/widgets/dotted_border_container.dart';
import '../../../../core/common/widgets/quizz_status_tile.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/quiz_dashboard_model.dart';

class QuizDeleteDialogItem extends StatelessWidget {
  const QuizDeleteDialogItem({super.key, required this.quizModel});

  final QuizDashboardModel quizModel;

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
        QuizzStatusTile(quizz: quizModel),
      ],
    );
  }

  Widget quizContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.quizDeleteDialogItemBorderRadius), color: AppColorScheme.surfaceContainer),
      child: DottedBorderContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ).addPadding(
          padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        ),
      ),
    );
  }

  Widget quizHeader(BuildContext context) {
    return Text(
      quizModel.title,
      style: context.theme.textTheme.headlineSmall!.copyWith(
        fontSize: AppTheme.quizDeleteDialogHeaderFontSize,
      ),
      maxLines: AppTheme.quizDeleteDialogHeaderMaxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget quizDescription(BuildContext context) {
    return Text(
      quizModel.description,
      style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
      maxLines: AppTheme.quizDeleteDialogDescriptionMaxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
