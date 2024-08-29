import 'package:flutter/material.dart';

import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/basic_dialog.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../generated/l10n.dart';
import '../refactors/add_question_dialog_answer_section.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Map<Answer, TextEditingController> answerControllers = {
    Answer.A: TextEditingController(),
    Answer.B: TextEditingController(),
    Answer.C: TextEditingController(),
    Answer.D: TextEditingController(),
  };

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    answerControllers.forEach((key, value) => value.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: S.of(context).quizzCreationAddQuestionHeading,
      content: _dialogContent(),
      actions: [
        SecondaryButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: S.of(context).cancelButton,
          contentColor: AppColorScheme.primary,
          bgColor: Colors.transparent,
          width: null,
        ),
        BasicButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
          },
          text: S.of(context).quizzCreationSaveQuestion,
        ),
      ],
    );
  }

  Widget _dialogContent() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LargeVSpacer(),
            IFormField(
              labelText: S.of(context).quizzCreationAddQuestionTitleLabel,
              hintText: S.of(context).quizzCreationAddQuestionTitleHint,
              obscureText: false,
              controller: titleController,
            ),
            const LargeVSpacer(),
            IFormField(
              labelText: S.of(context).quizzCreationAddQuestionDescriptionLabel,
              hintText: S.of(context).quizzCreationAddQuestionDescriptionHint,
              obscureText: false,
              controller: descriptionController,
            ),
            const LargeVSpacer(),
            AddQuestionDialogAnswerSection(
              answerControllers: answerControllers,
            ),
          ],
        ),
      ),
    );
  }
}
