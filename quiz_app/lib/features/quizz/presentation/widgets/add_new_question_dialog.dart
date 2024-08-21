import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/dialogs/basic_dialog.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/features/quizz/presentation/refactors/add_question_dialog_answer_section.dart';
import 'package:quiz_app/generated/l10n.dart';

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
  final TextEditingController answerController1 = TextEditingController();
  final TextEditingController answerController2 = TextEditingController();
  final TextEditingController answerController3 = TextEditingController();
  final TextEditingController answerController4 = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    answerController1.dispose();
    answerController2.dispose();
    answerController3.dispose();
    answerController4.dispose();
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LargeVSpacer(),
          IFormField(
            labelText: S.of(context).quizzCreationAddQuestionTitleLabel,
            hintText: S.of(context).quizzCreationAddQuestionTitleHint,
            required: true,
            obscureText: false,
            controller: titleController,
          ),
          const LargeVSpacer(),
          IFormField(
            labelText: S.of(context).quizzCreationAddQuestionDescriptionLabel,
            hintText: S.of(context).quizzCreationAddQuestionDescriptionHint,
            required: true,
            obscureText: false,
            controller: descriptionController,
          ),
          const LargeVSpacer(),
          AddQuestionDialogAnswerSection(
            answerController1: answerController1,
            answerController2: answerController2,
            answerController3: answerController3,
            answerController4: answerController4,
          ),
        ],
      ),
    );
  }
}
