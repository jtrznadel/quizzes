import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../features/quiz_generation/domain/question_model.dart';
import 'dotted_border_container.dart';
import 'new_question/add_question_dialog_answer_section.dart';
import 'answer_tile.dart';
import 'spacers/vertical_spacers.dart';
import '../../extensions/add_padding_extension.dart';
import '../../extensions/context_extension.dart';
import '../../res/media_res.dart';
import '../../theme/app_color_scheme.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox(
      {super.key, required this.questionIndex, required this.question, required this.onDelete, required this.correctAnswerVisible});

  final int questionIndex;
  final QuestionModel question;
  final VoidCallback onDelete;
  final bool correctAnswerVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorScheme.questionBoxContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DottedBorderContainer(
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
                      onPressed: () {},
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
                      isCorrect: correctAnswerVisible ? question.createAnswersDto[index].isCorrect : false,
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
    );
  }
}
