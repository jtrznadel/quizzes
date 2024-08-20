import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/answer_tile.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({super.key});

  //TODO: Questionbox should operate with a question model, so after receive api documentations we can implement it

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColorScheme.border,
      strokeWidth: 1.5,
      dashPattern: const [4, 2],
      radius: const Radius.circular(8),
      borderType: BorderType.RRect,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
          width: double.infinity,
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
                      '1. ${StringRes.tempQuestion}',
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
          ),
        ),
      ),
    );
  }
}
