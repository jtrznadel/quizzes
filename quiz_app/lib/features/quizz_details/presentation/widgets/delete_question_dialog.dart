import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../quizz/presentation/refactors/add_question_dialog_answer_section.dart';
import '../../domain/question_details_model.dart';

class DeleteQuestionDialog extends ConsumerWidget {
  const DeleteQuestionDialog({super.key, required this.question});

  final QuestionDetailsModel question;

  static void show(BuildContext context, QuestionDetailsModel question) {
    showDialog(
      context: context,
      builder: (context) => Center(child: Wrap(children: [DeleteQuestionDialog(question: question)])),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DeleteDialog(
      //TODO: replace with translation
      title: 'Are you sure?',
      content: Column(
        children: [
          Text(
            //TODO: replace with translation
            'This action cannot be undone. Once you delete the question, there is no going back.',
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: AppColorScheme.textSecondary),
          ),
          const LargeVSpacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.mediumRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.deleteQuestionDetailsQuestionBoxPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.title,
                    style: context.theme.textTheme.headlineSmall
                        ?.copyWith(color: AppColorScheme.textPrimary),
                  ),
                  const MediumVSpacer(),
                  for (final (index, answer) in question.answers.indexed)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Answer.values[index].name,
                              style: context.theme.textTheme.labelMedium,
                            ),
                            const MediumHSpacer(),
                            Text(
                              answer.content,
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppColorScheme.textSecondary),
                            ),
                          ],
                        ),
                        const ExtraSmallVSpacer(),
                      ],
                    ),
                  
                ],
              ),
            ),
          )
        ],
      ),
      onConfirm: () {
        //TODO: Implement delete question
      },
    );
  }
}
