import 'package:flutter/material.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../domain/entities/test_quiz_entity.dart';
import 'quiz_delete_dialog_item.dart';

class DeleteQuizDialog extends StatelessWidget {
  const DeleteQuizDialog({super.key, required this.quiz});

  final TestQuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return DeleteDialog(
      title: "Are you sure?",
      content: Column(
        children: [
          Text(
            "This action cannot be undone. Once you delete the quiz there's no going back.",
            style: context.theme.textTheme.bodyMedium,
          ).addPadding(padding: const EdgeInsets.only(bottom: 24, top: 8)),
          QuizDeleteDialogItem(quizEntity: quiz),
        ],
      ),
      onConfirm: () {

      },
    );
  }
}
