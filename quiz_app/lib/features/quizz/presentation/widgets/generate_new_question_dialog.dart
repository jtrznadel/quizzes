import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/basic_dialog.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/string_res.dart';
import 'add_new_question_dialog.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/generated/l10n.dart';

import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_dialog.dart';

class GenerateNewQuestionDialog extends StatefulWidget {
  const GenerateNewQuestionDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const GenerateNewQuestionDialog(),
    );
  }

  @override
  State<GenerateNewQuestionDialog> createState() =>
      _GenerateNewQuestionDialogState();
}

class _GenerateNewQuestionDialogState extends State<GenerateNewQuestionDialog> {
  final TextEditingController promptController = TextEditingController();

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: StringRes.quizzCreationGenerateQuestionHeading,
      content: _dialogContent(),
      actions: [
        SecondaryButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: StringRes.quizzCreationQuitButtonCancel,
          bgColor: Colors.transparent,
          width: null,
        ),
        BasicButton(
          onPressed: () {
            Navigator.pop(context);
            AddNewQuestionDialog.show(context);
          },
          text: StringRes.quizzCreationGenerateQuestionGenerateButton,
          icon: SvgPicture.asset(
            MediaRes.generate,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  Widget _dialogContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        TextArea(
          labelText: StringRes.quizzCreationGenerateQuestionPromptLabel,
          hintText: StringRes.quizzCreationGenerateQuestionPromptHint,
          controller: promptController,
          maxLines: 10,
        ),
      ],
    );
  }
}
