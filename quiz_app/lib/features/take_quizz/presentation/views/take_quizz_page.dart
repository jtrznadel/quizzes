import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/quiz_status_badge.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../dashboard/domain/entities/test_quiz_entity.dart';
import '../widgets/quit_quizz_taking_dialog.dart';

@RoutePage()
class TakeQuizzPage extends StatelessWidget {
  const TakeQuizzPage({super.key, required this.quizEntity});

  final TestQuizEntity quizEntity;

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();

    return Scaffold(
      appBar: BasicAppBar(
        title: S.of(context).quizzTakeAppBarTitle,
        onBack: () {
          QuitQuizzTakingDialog.show(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quizzTakeHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              S.of(context).quizzTakeSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const LargeVSpacer(),
            Form(
              child: IFormField(
                labelText: S.of(context).quizzTakeFormFieldLabel,
                hintText: S.of(context).quizzTakeFormFieldHint,
                controller: usernameController,
              ),
            ),
            const LargeVSpacer(),
            TakeQuizzInfoBox(quizEntity: quizEntity),
            const LargeVSpacer(),
            BasicButton(
              onPressed: () {
                context.router.push(
                  const TakeQuizzWraperRoute(),
                );
              },
              text: 'Start Quizz',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class TakeQuizzInfoBox extends StatelessWidget {
  const TakeQuizzInfoBox({
    super.key,
    required this.quizEntity,
  });

  final TestQuizEntity quizEntity;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColorScheme.border,
      strokeWidth: 1.5,
      dashPattern: const [4, 4],
      radius: const Radius.circular(8),
      borderType: BorderType.RRect,
      borderPadding: const EdgeInsets.all(0.5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.takeQuizzInfoContainerPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.takeQuizzInfoContainerBorderRadius),
          color: AppColorScheme.surfaceContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quizEntity.quizTitle,
              style: context.textTheme.headlineMedium,
            ),
            const MediumVSpacer(),
            Text(
              quizEntity.quizDescription,
              style: context.textTheme.bodyLarge,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            const MediumVSpacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                QuizStatusBadge(
                  text: quizEntity.quizStatus,
                  backgroundColor: AppColorScheme.secondary,
                  textColor: AppColorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
