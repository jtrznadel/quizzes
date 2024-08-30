import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../application/quiz_generation_controller.dart';
import 'radio_list_tile.dart';
import '../../../../generated/l10n.dart';

enum QuestionType { MultipleChoice, TrueFalse }

class QuestionTypePicker extends ConsumerStatefulWidget {
  const QuestionTypePicker({super.key});

  @override
  ConsumerState<QuestionTypePicker> createState() => _QuestionTypePickerState();
}

class _QuestionTypePickerState extends ConsumerState<QuestionTypePicker> {
  QuestionType _selectedValue = QuestionType.MultipleChoice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizzCreationConfigureTypeQuestion,
          style: context.textTheme.labelLarge,
        ),
        const CustomVSpacer(12),
        IRadioListTile<QuestionType>(
          title: S.of(context).quizzCreationConfigureType1,
          value: QuestionType.MultipleChoice,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
              ref.read(quizGenerationControllerProvider.notifier).setTypeOfQuestions(value.name);
            });
          },
        ),
        const SmallVSpacer(),
        IRadioListTile<QuestionType>(
          title: S.of(context).quizzCreationConfigureType2,
          value: QuestionType.TrueFalse,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
              ref.read(quizGenerationControllerProvider.notifier).setTypeOfQuestions(value.name);
            });
          },
        ),
      ],
    );
  }
}