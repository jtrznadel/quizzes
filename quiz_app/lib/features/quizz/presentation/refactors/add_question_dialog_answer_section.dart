import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/checkbox.dart';
import 'package:quiz_app/core/common/widgets/spacers/horizontal_spacers.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/generated/l10n.dart';

class AddQuestionDialogAnswerSection extends StatefulWidget {
  const AddQuestionDialogAnswerSection({
    super.key,
    required this.answerController1,
    required this.answerController2,
    required this.answerController3,
    required this.answerController4,
  });

  final TextEditingController answerController1;
  final TextEditingController answerController2;
  final TextEditingController answerController3;
  final TextEditingController answerController4;

  @override
  State<AddQuestionDialogAnswerSection> createState() => _AddQuestionDialogAnswerSectionState();
}

class _AddQuestionDialogAnswerSectionState extends State<AddQuestionDialogAnswerSection> {
  int _selectedAnswerIndex = 0;

  void _onAnswerSelected(int index) {
    setState(() {
      _selectedAnswerIndex = index;
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
          answerController: widget.answerController1,
          isChecked: _selectedAnswerIndex == 0,
          onChanged: (value) => _onAnswerSelected(0),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerController2,
          isChecked: _selectedAnswerIndex == 1,
          onChanged: (value) => _onAnswerSelected(1),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerController3,
          isChecked: _selectedAnswerIndex == 2,
          onChanged: (value) => _onAnswerSelected(2),
        ),
        const SmallVSpacer(),
        AnswerTextArea(
          answerController: widget.answerController4,
          isChecked: _selectedAnswerIndex == 3,
          onChanged: (value) => _onAnswerSelected(3),
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
        const CustomHSpacer(12),
        Expanded(
          child: TextArea(
            hintText: S.of(context).quizzCreationAddQuestionAnswerPlaceholder,
            controller: answerController,
            minLines: 2,
            maxLines: 2,
            contentPadding: AppTheme.pageDefaultSpacingSize,
            textStyle: context.textTheme.bodySmall!.copyWith(
              color: AppColorScheme.textSecondary,
              height: 20 / 14,
            ),
          ),
        ),
      ],
    );
  }
}
