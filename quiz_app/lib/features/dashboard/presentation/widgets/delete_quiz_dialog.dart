import 'package:flutter/material.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../domain/entities/test_quiz_entity.dart';
import 'quiz_delete_dialog_item.dart';

class DeleteQuizDialog extends StatelessWidget {
  const DeleteQuizDialog({super.key, required this.quiz});

  final TestQuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return DeleteDialog(
      title: S.of(context).deleteAccountHeading,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SmallVSpacer(),
          Text(
            S.of(context).deleteQuizzDescription,
            style: context.theme.textTheme.bodyMedium,
          ),
          const LargeVSpacer(),
          QuizDeleteDialogItem(quizEntity: quiz),
        ],
      ),
      onConfirm: () {},
    );
  }

  static void show(BuildContext context, TestQuizEntity quiz) {
    showDialog(
      context: context,
      builder: (context) => DeleteQuizDialog(quiz: quiz),
    );
  }
}
