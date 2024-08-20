import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/dashboard/domain/entities/test_quiz_entity.dart';
import 'package:quiz_app/features/dashboard/presentation/widgets/quiz_delete_dialog_item.dart';

class DeleteQuizDialog extends StatelessWidget {
  const DeleteQuizDialog({super.key, required this.quiz});

  final TestQuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        backgroundColor: AppColorScheme.dialogBackground,
        contentPadding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        insetPadding: const EdgeInsets.all(16),
        title:
            Text("Are you sure?", style: context.theme.textTheme.headlineSmall),
        content: Column(
          children: [
            Text(
              "This action cannot be undone. Once you delete the quiz there's no going back.",
              style: context.theme.textTheme.bodyMedium,
            ).addPadding(padding: const EdgeInsets.only(bottom: 24, top: 8)),
            QuizDeleteDialogItem(quizEntity: quiz),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.navigator.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              "Cancel",
              style: context.theme.textTheme.labelMedium!
                  .copyWith(color: AppColorScheme.primary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //TODO: delete quiz
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.error,
            ),
            child: Text(
              "Delete",
              style: context.theme.textTheme.labelMedium!
                  .copyWith(color: AppColorScheme.textContrast),
            ),
          )
        ],
      ),
    );
  }
}
