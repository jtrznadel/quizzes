import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/radio_list_tile.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuestionCountPicker extends StatefulWidget {
  const QuestionCountPicker({super.key});

  @override
  State<QuestionCountPicker> createState() => _QuestionCountPickerState();
}

class _QuestionCountPickerState extends State<QuestionCountPicker> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizzCreationConfigureQuestionCount,
          style: context.textTheme.labelLarge,
        ),
        const CustomVSpacer(12),
        IRadioListTile<int>(
          title: S.of(context).quizzCreationConfigureQuestionCount1,
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SmallVSpacer(),
        IRadioListTile<int>(
          title: S.of(context).quizzCreationConfigureQuestionCount2,
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SmallVSpacer(),
        IRadioListTile<int>(
          title: S.of(context).quizzCreationConfigureQuestionCount3,
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SmallVSpacer(),
        IRadioListTile<int>(
          title: S.of(context).quizzCreationConfigureQuestionCount4,
          value: 4,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}
