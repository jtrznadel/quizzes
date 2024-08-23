import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/basic_dialog.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/res/media_res.dart';
import 'add_new_question_dialog.dart';
import '../../../../generated/l10n.dart';


class GenerateNewQuestionDialog extends StatefulWidget {
  const GenerateNewQuestionDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const GenerateNewQuestionDialog(),
    );
  }

  @override
  State<GenerateNewQuestionDialog> createState() => _GenerateNewQuestionDialogState();
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
      title: S.of(context).quizzCreationGenerateQuestionHeading,
      content: _dialogContent(),
      actions: [
        SecondaryButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: S.of(context).cancelButton,
          bgColor: Colors.transparent,
          width: null,
        ),
        BasicButton(
          onPressed: () {
            Navigator.pop(context);
            AddNewQuestionDialog.show(context);
          },
          text: S.of(context).quizzCreationGenerateQuestionGenerateButton,
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
        const LargeVSpacer(),
        TextArea(
          labelText: S.of(context).quizzCreationGenerateQuestionPromptLabel,
          hintText: S.of(context).quizzCreationGenerateQuestionPromptHint,
          controller: promptController,
          maxLines: 10,
        ),
      ],
    );
  }
}
