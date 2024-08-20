import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/answer_tile.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({super.key, required this.questionNumber});

  final int questionNumber;

  //TODO: Questionbox should operate with a question model, so after receive api documentations we can implement it

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
                      '$questionNumber. ${StringRes.tempQuestion}',
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
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          MediaRes.trash,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                StringRes.tempQuestionDescription,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              const Column(
                children: [
                  AnswerTile(leading: 'A', text: StringRes.tempAnswer1),
                  SizedBox(
                    height: 8,
                  ),
                  AnswerTile(leading: 'B', text: StringRes.tempAnswer2),
                  SizedBox(
                    height: 8,
                  ),
                  AnswerTile(leading: 'C', text: StringRes.tempAnswer3),
                  SizedBox(
                    height: 8,
                  ),
                  AnswerTile(leading: 'D', text: StringRes.tempAnswer4),
                ],
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
