import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/quiz_generation/application/quiz_generation_controller.dart';
import '../../../../features/quiz_generation/domain/answer_model.dart';
import '../../../../features/quiz_generation/domain/question_model.dart';
import 'add_question_dialog_answer_section.dart';
import '../basic_button.dart';
import '../dialogs/basic_dialog.dart';
import '../form_field.dart';
import '../secondary_button.dart';
import '../spacers/vertical_spacers.dart';
import '../../../theme/app_color_scheme.dart';
import '../../../../generated/l10n.dart';

class AddNewQuestionDialog extends ConsumerStatefulWidget {
  const AddNewQuestionDialog({super.key});

  @override
  ConsumerState createState() => _AddNewQuestionDialogState();

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

class _AddNewQuestionDialogState extends ConsumerState<AddNewQuestionDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Map<Answer, AnswerWithValidation> answerControllers = {
    Answer.A: AnswerWithValidation(TextEditingController(), true),
    Answer.B: AnswerWithValidation(TextEditingController(), false),
    Answer.C: AnswerWithValidation(TextEditingController(), false),
    Answer.D: AnswerWithValidation(TextEditingController(), false),
  };

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    answerControllers.forEach((key, value) => value.controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generationController =
        ref.read(quizGenerationControllerProvider.notifier);
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
            if (_formKey.currentState!.validate()) {
              final question = QuestionModel(
                title: titleController.text,
                createAnswersDto: List.generate(
                  answerControllers.length,
                  (index) => AnswerModel(
                    content: answerControllers.values.elementAt(index).controller.text,
                    isCorrect: answerControllers.values.elementAt(index).isCorrect,
                  ),
                ),
              );
              generationController.addNewQuestion(question);
              Navigator.of(context).pop();
            }
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
            isRequired: true,
            obscureText: false,
            controller: titleController,
          ),
          const LargeVSpacer(),
          AddQuestionDialogAnswerSection(
            answerControllers: answerControllers,
          ),
        ],
      ),
    );
  }
}

class AnswerWithValidation{
  final TextEditingController controller;
  bool isCorrect;

  AnswerWithValidation(this.controller, this.isCorrect);
}