import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/checkbox.dart';
import '../../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../../core/common/widgets/text_area.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/theme/app_color_scheme.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../generated/l10n.dart';
import 'add_new_question_dialog.dart';

enum Answer {
  A,
  B,
  C,
  D,
}

class AddQuestionDialogAnswerSection extends StatefulWidget {
  const AddQuestionDialogAnswerSection(
      {super.key, required this.answerControllers});

  final Map<Answer, AnswerWithValidation> answerControllers;

  @override
  State<AddQuestionDialogAnswerSection> createState() =>
      _AddQuestionDialogAnswerSectionState();
}

class _AddQuestionDialogAnswerSectionState
    extends State<AddQuestionDialogAnswerSection> {
  Answer? _selectedAnswer;

  void _onAnswerSelected(MapEntry<Answer, AnswerWithValidation> answer) {
    setState(() {
      _selectedAnswer = answer.key;
      answer.value.isCorrect = true;
      uncheckOtherAnswers(answer.key);
    });
  }

  void uncheckOtherAnswers(Answer selectedAnswer) {
    widget.answerControllers.forEach((key, value) {
      if (key != selectedAnswer) {
        value.isCorrect = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedAnswer ??= widget.answerControllers.keys.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizzCreationAddQuestionAnswersLabel,
          style: context.textTheme.bodyMedium,
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers.values.elementAt(0).controller,
          isChecked:
              _selectedAnswer == Answer.A,
          onChanged: (value) =>
              _onAnswerSelected(widget.answerControllers.entries.elementAt(0)),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers.values.elementAt(1).controller,
          isChecked:
              _selectedAnswer == Answer.B,
          onChanged: (value) =>
              _onAnswerSelected(widget.answerControllers.entries.elementAt(1)),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers.values.elementAt(2).controller,
          isChecked:
              _selectedAnswer == Answer.C,
          onChanged: (value) =>
              _onAnswerSelected(widget.answerControllers.entries.elementAt(2)),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers.values.elementAt(3).controller,
          isChecked:
              _selectedAnswer == Answer.D,
          onChanged: (value) =>
              _onAnswerSelected(widget.answerControllers.entries.elementAt(3)),
        ),
      ],
    );
  }
}

class AnswerTextArea extends StatelessWidget {
  const AnswerTextArea({
    super.key,
    required this.answerController,
    required this.isChecked,
    required this.onChanged,
  });

  final TextEditingController answerController;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ICheckbox(value: isChecked, onChanged: onChanged),
        const CustomHSpacer(AppTheme.addQuestionDialogAnswerHorizontalSpacer),
        Expanded(
          child: TextArea(
            hintText: S.of(context).quizzCreationAddQuestionAnswerPlaceholder,
            controller: answerController,
            minLines: 2,
            maxLines: 2,
            contentPadding: AppTheme.pageDefaultSpacingSize,
            textStyle: context.textTheme.bodySmall!.copyWith(
              color: AppColorScheme.textSecondary,
              height: AppTheme.addQuestionDialogTextAreaHeight,
            ),
          ),
        ),
      ],
    );
  }
}