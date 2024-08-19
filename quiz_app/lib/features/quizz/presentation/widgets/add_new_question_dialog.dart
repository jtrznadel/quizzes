import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/refactors/add_question_dialog_answer_section.dart';

class AddNewQuestionDialog extends StatefulWidget {
  const AddNewQuestionDialog({super.key});

  @override
  State<AddNewQuestionDialog> createState() => _AddNewQuestionDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            AddNewQuestionDialog(),
          ],
        ),
      ),
    );
  }
}

class _AddNewQuestionDialogState extends State<AddNewQuestionDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController answer1Controller = TextEditingController();
  final TextEditingController answer2Controller = TextEditingController();
  final TextEditingController answer3Controller = TextEditingController();
  final TextEditingController answer4Controller = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    answer1Controller.dispose();
    answer2Controller.dispose();
    answer3Controller.dispose();
    answer4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColorScheme.dialogBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringRes.quizzCreationAddQuestionHeading,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 24,
            ),
            IFormField(
              labelText: StringRes.quizzCreationAddQuestionTitleLabel,
              hintText: StringRes.quizzCreationAddQuestionTitleHint,
              required: true,
              obscureText: false,
              controller: titleController,
            ),
            const SizedBox(
              height: 24,
            ),
            IFormField(
              labelText: StringRes.quizzCreationAddQuestionDescriptionLabel,
              hintText: StringRes.quizzCreationAddQuestionDescriptionHint,
              required: true,
              obscureText: false,
              controller: descriptionController,
            ),
            const SizedBox(
              height: 24,
            ),
            AddQuestionDialogAnswerSection(
              answer1Controller: answer1Controller,
              answer2Controller: answer2Controller,
              answer3Controller: answer3Controller,
              answer4Controller: answer4Controller,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  onPressed: () {
                    //TODO: implement cancel button functionality with a confirmation dialog
                  },
                  text: StringRes.quizzCreationQuitButtonCancel,
                  contentColor: AppColorScheme.primary,
                  bgColor: Colors.transparent,
                  width: 110,
                ),
                BasicButton(
                  onPressed: () {
                    //TODO: implement validator to check if all fields are filled and correct answer is picked
                  },
                  text: StringRes.quizzCreationSaveQuestion,
                  width: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
