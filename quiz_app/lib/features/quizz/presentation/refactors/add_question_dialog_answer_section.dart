import 'package:flutter/material.dart';

import '../../../../core/common/widgets/checkbox.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';

enum Answer {
  A,
  B,
  C,
  D,
}

class AddQuestionDialogAnswerSection extends StatefulWidget {
  const AddQuestionDialogAnswerSection({
    super.key,
    required this.answerControllers
  });


  final Map<Answer, TextEditingController> answerControllers;

  @override
  State<AddQuestionDialogAnswerSection> createState() => _AddQuestionDialogAnswerSectionState();
}

class _AddQuestionDialogAnswerSectionState extends State<AddQuestionDialogAnswerSection> {
  Answer _selectedAnswer = Answer.A;

  void _onAnswerSelected(Answer answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizzCreationAddQuestionAnswersLabel,
          style: context.textTheme.bodyMedium,
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers[Answer.A]!,
          isChecked: _selectedAnswer == Answer.A,
          onChanged: (value) => _onAnswerSelected(Answer.A),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers[Answer.B]!,
          isChecked: _selectedAnswer == Answer.B,
          onChanged: (value) => _onAnswerSelected(Answer.B),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers[Answer.C]!,
          isChecked: _selectedAnswer == Answer.C,
          onChanged: (value) => _onAnswerSelected(Answer.C),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerControllers[Answer.D]!,
          isChecked: _selectedAnswer == Answer.D,
          onChanged: (value) => _onAnswerSelected(Answer.D),
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
