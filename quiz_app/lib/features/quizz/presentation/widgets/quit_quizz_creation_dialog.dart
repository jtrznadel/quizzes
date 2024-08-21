import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/dialogs/basic_dialog.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/spacers/horizontal_spacers.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuitQuizzCreationDialog extends StatelessWidget {
  const QuitQuizzCreationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: StringRes.quizzCreationQuitHeading,
      content: _dialogContent(context),
      actions: [
        SecondaryButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: StringRes.quizzCreationQuitButtonCancel,
          width: null,
          bgColor: Colors.transparent,
          contentColor: AppColorScheme.primary,
        ),
        const SmallHSpacer(),
        SecondaryButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          text: StringRes.quizzCreationQuitButton,
          width: null,
          bgColor: AppColorScheme.error,
          contentColor: AppColorScheme.textContrast,
        ),
      ],
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SmallVSpacer(),
        Text(
          StringRes.quizzCreationQuitSubheading,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const QuitQuizzCreationDialog(),
    );
  }
}
