import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class QuizDetailsGeneralTab extends StatelessWidget {
  const QuizDetailsGeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    titleController.text = StringRes.tempQuizzSummaryTitle;
    descriptionController.text = StringRes.tempQuizzSummaryDescription;
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
        StringRes.quizzDetailsTabGeneralSubheading,
        style: context.textTheme.bodyMedium!
            .copyWith(color: AppColorScheme.textSecondary),
      ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
    ]);
  }

  Widget pageSettingsHeader(BuildContext context) {
    return Row(children: [
      Text(
        StringRes.quizzDetailsTabGeneralPageSettingsHeading,
        style: context.textTheme.headlineMedium!.copyWith(fontSize: 18),
      ),
    ]);
  }

  //TODO: modify text area widget to accept a background color
  Widget quizTitleTextField(
      BuildContext context, TextEditingController controller) {
    return Column(
      children: [
        TextArea(
          labelText: StringRes.quizzDetailsTabGeneralQuizTitle,
          hintText: StringRes.quizzDetailsTabGeneralQuizTitleHint,
          controller: controller,
          minLines: 1,
          maxLines: 3,
        ).addPadding(padding: const EdgeInsets.only(bottom: 8)),
        Text(
          StringRes.quizzDetailsTabGeneralQuizTitleTextFieldDescription,
          style: context.textTheme.bodyMedium!
              .copyWith(color: AppColorScheme.textSecondary),
        ).addPadding(padding: const EdgeInsets.only(bottom: 8))
      ],
    ).addPadding(padding: const EdgeInsets.only(top: 16));
  }

  //TODO: modify text area widget to accept a background color
  Widget quizDescriptionTextField(
      BuildContext context, TextEditingController controller) {
    return Column(
      children: [
        TextArea(
          labelText: StringRes.quizzDetailsTabGeneralQuizDescription,
          hintText: StringRes.quizzDetailsTabGeneralQuizDescriptionHint,
          controller: controller,
          minLines: 1,
          maxLines: 10,
        ).addPadding(padding: const EdgeInsets.only(bottom: 8)),
        Text(
          StringRes.quizzDetailsTabGeneralQuizDescriptionTextFieldDescription,
          style: context.textTheme.bodyMedium!
              .copyWith(color: AppColorScheme.textSecondary),
        ).addPadding(padding: const EdgeInsets.only(bottom: 8))
      ],
    ).addPadding(padding: const EdgeInsets.only(top: 16));
  }

  Widget saveButton(BuildContext context, TextEditingController titleController,
      TextEditingController descriptionController) {
    return Align(
      alignment: Alignment.centerRight,
      child: BasicButton(
        onPressed: () {
          kDebugMode
              ? debugPrint(
                  'Title: ${titleController.text}\nDescription: ${descriptionController.text}')
              : null;
        },
        text: 'Save changes',
        width: context.width * 0.4,
      ).addPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
    );
  }
}
