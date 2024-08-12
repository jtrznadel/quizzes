import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/radio_list_tile.dart';

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
          StringRes.quizzCreationConfigureQuestionCount,
          style: context.textTheme.labelLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        IRadioListTile<int>(
          title: StringRes.quizzCreationConfigureQuestionCount1,
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 8,
        ),
        IRadioListTile<int>(
          title: StringRes.quizzCreationConfigureQuestionCount2,
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 8,
        ),
        IRadioListTile<int>(
          title: StringRes.quizzCreationConfigureQuestionCount3,
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 8,
        ),
        IRadioListTile<int>(
          title: StringRes.quizzCreationConfigureQuestionCount4,
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
