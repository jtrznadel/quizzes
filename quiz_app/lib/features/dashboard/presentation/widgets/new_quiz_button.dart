import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_creation_screen.dart';

class NewQuizButton extends StatelessWidget {
  const NewQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColorScheme.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.navigator.pushNamed(QuizzCreationScreen.routeName);
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: AppColorScheme.border,
            strokeWidth: 1.5,
            radius: const Radius.circular(8),
            borderPadding: const EdgeInsets.all(0.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(MediaRes.addQuiz, width: 32, height: 32),
                      Text(
                        'Add new quiz',
                        style: context.theme.textTheme.headlineMedium!.copyWith(
                          color: AppColorScheme.onPrimary,
                        ),
                      ).addPadding(padding: const EdgeInsets.only(top: 8)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
