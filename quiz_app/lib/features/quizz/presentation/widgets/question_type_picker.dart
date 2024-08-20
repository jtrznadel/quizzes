import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/radio_list_tile.dart';

class QuestionTypePicker extends StatefulWidget {
  const QuestionTypePicker({super.key});

  @override
  State<QuestionTypePicker> createState() => _QuestionTypePickerState();
}

class _QuestionTypePickerState extends State<QuestionTypePicker> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringRes.quizzCreationConfigureTypeQuestion,
          style: context.textTheme.labelLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        IRadioListTile<int>(
          title: StringRes.quizzCreationConfigureType1,
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
          title: StringRes.quizzCreationConfigureType2,
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
          title: StringRes.quizzCreationConfigureType3,
          value: 3,
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
