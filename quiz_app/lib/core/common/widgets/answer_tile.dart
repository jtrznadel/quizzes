import 'package:flutter/material.dart';
import '../../theme/app_color_scheme.dart';
import 'spacers/horizontal_spacers.dart';
import 'vertical_divider.dart';
import '../../extensions/context_extension.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.leading,
    required this.text,
    required this.isCorrect,
  });

  final String text;
  final String leading;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isCorrect ? AppColorScheme.successLight : Colors.white,
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              leading,
              style: context.textTheme.labelMedium!.copyWith(
                color: isCorrect
                    ? AppColorScheme.success
                    : AppColorScheme.textPrimary,
              ),
            ),
            const MediumHSpacer(),
            const IVerticalDivider(),
          ],
        ),
        title: Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: isCorrect
                ? AppColorScheme.success
                : AppColorScheme.textPrimary,
          ),
        ),
      ),
    );
  }
}