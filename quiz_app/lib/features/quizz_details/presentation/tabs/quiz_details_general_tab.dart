import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../../core/common/widgets/info_snackbar.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/quiz_details_controller.dart';
import '../../application/quiz_details_state.dart';
import '../../domain/quiz_details_model.dart';

class QuizDetailsGeneralTab extends ConsumerWidget {
  const QuizDetailsGeneralTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizDetailsControllerProvider);
    final controller = ref.read(quizDetailsControllerProvider.notifier);
    return state.maybeWhen(
      loaded: (quizDetails, _) {
        final titleController = TextEditingController(text: quizDetails.title);
        final descriptionController = TextEditingController(text: quizDetails.description);
        return Column(
          children: [
            const MediumVSpacer(),
            generalHeader(context),
            const MediumVSpacer(),
            pageSettingsHeader(context),
            const MediumVSpacer(),
            quizTitleTextField(context, titleController),
            const MediumVSpacer(),
            quizDescriptionTextField(context, descriptionController),
            const MediumVSpacer(),
            saveButton(
              context,
              quizDetails,
              titleController,
              descriptionController,
              controller,
              state,
              ref,
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget generalHeader(BuildContext context) {
    return Text(
      S.of(context).quizzDetailsTabGeneralSubheading,
      style: context.textTheme.bodyMedium?.copyWith(color: AppColorScheme.textSecondary),
    );
  }

  Widget pageSettingsHeader(BuildContext context) {
    return Row(children: [
      Text(
        S.of(context).quizzDetailsTabGeneralPageSettingsHeading,
        style: context.textTheme.headlineMedium?.copyWith(fontSize: 18),
      ),
    ]);
  }

  Widget quizTitleTextField(BuildContext context, TextEditingController controller) {
    return Column(
      children: [
        TextArea(
          labelText: S.of(context).quizzDetailsTabGeneralQuizTitle,
          hintText: S.of(context).quizzDetailsTabGeneralQuizTitleHint,
          controller: controller,
          minLines: 1,
          maxLines: 3,
        ),
        const SmallVSpacer(),
        Text(
          S.of(context).quizzDetailsTabGeneralQuizTitleTextFieldDescription,
          style: context.textTheme.bodyMedium?.copyWith(color: AppColorScheme.textSecondary),
        ),
        const SmallVSpacer(),
      ],
    );
  }

  Widget quizDescriptionTextField(BuildContext context, TextEditingController controller) {
    return Column(
      children: [
        TextArea(
          labelText: S.of(context).quizzDetailsTabGeneralQuizDescription,
          hintText: S.of(context).quizzDetailsTabGeneralQuizDescriptionHint,
          controller: controller,
          minLines: 1,
          maxLines: 10,
        ),
        const SmallVSpacer(),
        Text(
          S.of(context).quizzDetailsTabGeneralQuizDescriptionTextFieldDescription,
          style: context.textTheme.bodyMedium?.copyWith(color: AppColorScheme.textSecondary),
        ),
        const SmallVSpacer(),
      ],
    );
  }

  Widget saveButton(
    BuildContext context,
    QuizDetailsModel quiz,
    TextEditingController titleController,
    TextEditingController descriptionController,
    QuizDetailsController controller,
    QuizDetailsState state,
    WidgetRef ref,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: BasicButton(
        onPressed: () async {
          final success = await controller.updateQuizDetails(
            quiz.id,
            titleController.text,
            descriptionController.text,
          );
          if (context.mounted) {
            if (success) {
              InfoSnackbar.show(
                context,
                S.of(context).quizzDetailsTabGeneralSuccessfullSave,
                color: AppColorScheme.success,
              );
            } else {
              ErrorSnackbar.show(
                context,
                S.current.somethingWentWrong,
              );
            }
          }
        },
        text: S.of(context).quizzDetailsSaveChangesButton,
      ),
    );
  }
}
