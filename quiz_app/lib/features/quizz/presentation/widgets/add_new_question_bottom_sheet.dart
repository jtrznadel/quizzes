import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/bottom_sheet_tile.dart';

class AddNewQuestionBottomSheet extends StatelessWidget {
  const AddNewQuestionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringRes.addNewQuestionBottomSheetHeading,
          style: context.theme.textTheme.headlineMedium,
        ).addPadding(
          padding: const EdgeInsets.only(top: 24),
        ),
        BottomSheetTile(
          text: StringRes.addNewQuestionBottomSheetManual,
          icon: SvgPicture.asset(MediaRes.addQuestionManual),
          onTap: () {
            //TODO: add manual question logic
          },
        ),
        BottomSheetTile(
          text: StringRes.addNewQuestionBottomSheetAI,
          icon: SvgPicture.asset(MediaRes.addQuestionAI),
          onTap: () {
            //TODO: add manual question logic
          },
        )
      ],
    ).addPadding(padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16));
  }

  //TODO: add return type to get question add mode (manual, AI generated)
  static void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const Wrap(
        children: [
          AddNewQuestionBottomSheet(),
        ],
      ),
    );
  }
}
