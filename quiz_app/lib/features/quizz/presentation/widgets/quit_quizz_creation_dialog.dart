import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuitQuizzCreationDialog extends StatelessWidget {
  const QuitQuizzCreationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColorScheme.dialogBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quizzCreationQuitHeading,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.of(context).quizzCreationQuitSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: S.of(context).quizzCreationQuitButtonCancel,
                  width: 130,
                  bgColor: Colors.transparent,
                  contentColor: AppColorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                SecondaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  text: S.of(context).quizzCreationQuitButton,
                  width: 130,
                  bgColor: AppColorScheme.error,
                  contentColor: AppColorScheme.textContrast,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            QuitQuizzCreationDialog(),
          ],
        ),
      ),
    );
  }
}
