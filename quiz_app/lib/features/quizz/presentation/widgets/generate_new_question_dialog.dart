import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_dialog.dart';

class GenerateNewQuestionDialog extends StatefulWidget {
  const GenerateNewQuestionDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            GenerateNewQuestionDialog(),
          ],
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.pageDefaultSpacingSize),
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
              StringRes.quizzCreationGenerateQuestionHeading,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 24,
            ),
            TextArea(
              labelText: StringRes.quizzCreationGenerateQuestionPromptLabel,
              hintText: StringRes.quizzCreationGenerateQuestionPromptHint,
              controller: promptController,
              maxLines: 10,
              textStyle: context.textTheme.bodyMedium!.copyWith(
                color: AppColorScheme.textSecondary,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: StringRes.quizzCreationQuitButtonCancel,
                  bgColor: Colors.transparent,
                  width: 110,
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
                  width: 160,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
