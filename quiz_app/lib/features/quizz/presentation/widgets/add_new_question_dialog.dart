import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/auth/presentation/widgets/auth_form_field.dart';

class AddNewQuestionDialog extends StatefulWidget {
  const AddNewQuestionDialog({super.key});

  @override
  State<AddNewQuestionDialog> createState() => _AddNewQuestionDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Wrap(
        children: [
          AddNewQuestionDialog(),
        ],
      ),
    );
  }
}

class _AddNewQuestionDialogState extends State<AddNewQuestionDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
            Material(
              child: AuthFormField(
                labelText: StringRes.quizzCreationAddQuestionTitleLabel,
                hintText: StringRes.quizzCreationAddQuestionTitleHint,
                required: true,
                obscureText: false,
                controller: titleController,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Material(
              child: AuthFormField(
                labelText: StringRes.quizzCreationAddQuestionDescriptionLabel,
                hintText: StringRes.quizzCreationAddQuestionDescriptionHint,
                required: true,
                obscureText: false,
                controller: descriptionController,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              StringRes.quizzCreationAddQuestionAnswersLabel,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
