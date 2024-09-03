import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../features/quiz_generation/domain/question_model.dart';
import 'new_question/add_question_dialog_answer_section.dart';
import 'answer_tile.dart';
import 'spacers/vertical_spacers.dart';
import '../../extensions/add_padding_extension.dart';
import '../../extensions/context_extension.dart';
import '../../res/media_res.dart';
import '../../theme/app_color_scheme.dart';
import '../../../generated/l10n.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox(
      {super.key, required this.questionIndex, required this.question, required this.onDelete});

  final int questionIndex;
  final QuestionModel question;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorScheme.questionBoxContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DottedBorder(
        color: AppColorScheme.border,
        strokeWidth: 1.5,
        dashPattern: const [4, 2],
        radius: const Radius.circular(8),
        borderType: BorderType.RRect,
        borderPadding: const EdgeInsets.all(0.5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${questionIndex + 1}. ${question.title}',
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => onDelete(),
                        icon: SvgPicture.asset(
                          MediaRes.pencil,
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return IconButton(
                            onPressed: () {
                              onDelete();
                            },
                            icon: SvgPicture.asset(
                              MediaRes.trash,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SmallVSpacer(),
              Text(
                S.of(context).tempQuestionDescription,
                style: context.textTheme.bodyMedium,
              ),
              const MediumVSpacer(),
              ListView.builder(
                itemCount: question.createAnswersDto.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AnswerTile(
                        leading: Answer.values[index].name,
                        text: question.createAnswersDto[index].content,
                        isCorrect: question.createAnswersDto[index].isCorrect,
                      ),
                      const SmallVSpacer(),
                    ],
                  );
                },
              )
            ],
          ).addPadding(
            padding: const EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }
}
