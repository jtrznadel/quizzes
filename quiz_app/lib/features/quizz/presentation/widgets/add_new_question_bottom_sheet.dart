import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_dialog.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/bottom_sheet_tile.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/generate_new_question_dialog.dart';
import 'package:quiz_app/generated/l10n.dart';

class AddNewQuestionBottomSheet extends StatelessWidget {
  const AddNewQuestionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SmallVSpacer(),
        Text(
          S.of(context).addNewQuestionBottomSheetHeading,
          style: context.theme.textTheme.headlineMedium,
        ),
        BottomSheetTile(
          text: S.of(context).addNewQuestionBottomSheetManual,
          icon: SvgPicture.asset(MediaRes.addQuestionManual),
          onTap: () {
            Navigator.pop(context);
            AddNewQuestionDialog.show(context);
          },
        ),
        BottomSheetTile(
          text: S.of(context).addNewQuestionBottomSheetAI,
          icon: SvgPicture.asset(MediaRes.addQuestionAI),
          onTap: () {
            Navigator.pop(context);
            GenerateNewQuestionDialog.show(context);
          },
        )
      ],
    ).addPadding(padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize));
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
