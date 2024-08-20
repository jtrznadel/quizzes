import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuizDetailsGeneralTab extends StatelessWidget {
  const QuizDetailsGeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    titleController.text = S.of(context).tempQuizzSummaryTitle;
    descriptionController.text = S.of(context).tempQuizzSummaryDescription;
    return Column(
      children: [
        generalHeader(context),
        pageSettingsHeader(context),
        quizTitleTextField(context, titleController),
        quizDescriptionTextField(context, descriptionController),
        saveButton(context, titleController, descriptionController)
      ],
    );
  }

  Widget generalHeader(BuildContext context) {
    return Row(children: [
      Text(
        S.of(context).quizzDetailsTabGeneralSubheading,
        style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
      ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
    ]);
  }

  Widget pageSettingsHeader(BuildContext context) {
    return Row(children: [
      Text(
        S.of(context).quizzDetailsTabGeneralPageSettingsHeading,
        style: context.textTheme.headlineMedium!.copyWith(fontSize: 18),
      ),
    ]);
  }

  Widget quizTitleTextField(
      BuildContext context, TextEditingController controller) {
    return Column(
      children: [
        TextArea(
          labelText: S.of(context).quizzDetailsTabGeneralQuizTitle,
          hintText: S.of(context).quizzDetailsTabGeneralQuizTitleHint,
          controller: controller,
          minLines: 1,
          maxLines: 3,
        ).addPadding(padding: const EdgeInsets.only(bottom: 8)),
        Text(
          S.of(context).quizzDetailsTabGeneralQuizTitleTextFieldDescription,
          style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
        ).addPadding(padding: const EdgeInsets.only(bottom: 8))
      ],
    ).addPadding(padding: const EdgeInsets.only(top: 16));
  }


  Widget saveButton(BuildContext context, TextEditingController titleController, TextEditingController descriptionController) {
    return Align(
      alignment: Alignment.centerRight,
      child: BasicButton(
        onPressed: () {
        },
        //TODO: replace with string res
        text: 'Save changes',
      ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
    );
  }
}
