import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../application/quiz_generation_controller.dart';
import 'question_type_button.dart';
import '../../../../generated/l10n.dart';

enum QuestionType { MultipleChoice, TrueFalse }

class QuestionTypePicker extends ConsumerStatefulWidget {
  const QuestionTypePicker({super.key});

  @override
  ConsumerState<QuestionTypePicker> createState() => _QuestionTypePickerState();
}

class _QuestionTypePickerState extends ConsumerState<QuestionTypePicker> {
  bool multipleChoice = false;
  bool trueFalse = false;
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
        QuestionTypeButton(
          title: S.of(context).quizzCreationConfigureType1,
          value: multipleChoice,
          onChanged: (value) {
            setState(() {
              value = !value;
              multipleChoice = value;
              if(value) {
                ref.read(quizGenerationControllerProvider.notifier).addTypeOfQuestions(QuestionType.MultipleChoice.name);
              }
              else{
                ref.read(quizGenerationControllerProvider.notifier).removeTypeOfQuestions(QuestionType.MultipleChoice.name);
              }
            });
          },
        ),
        const SmallVSpacer(),
        QuestionTypeButton(
          title: S.of(context).quizzCreationConfigureType2,
          value: trueFalse,
          onChanged: (value) {
            setState(() {
              value = !value;
              trueFalse = value;
              if(value) {
                ref.read(quizGenerationControllerProvider.notifier).addTypeOfQuestions(QuestionType.TrueFalse.name);
              }
              else{
                ref.read(quizGenerationControllerProvider.notifier).removeTypeOfQuestions(QuestionType.TrueFalse.name);
              }
            });
          },
        ),
      ],
    );
  }
}