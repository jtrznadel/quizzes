import 'package:flutter/material.dart';
import 'spacers/horizontal_spacers.dart';
import 'vertical_divider.dart';
import '../../extensions/context_extension.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({super.key, required this.leading, required this.text});

  final String text;
  final String leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              leading,
              style: context.textTheme.labelMedium,
            ),
            const MediumHSpacer(),
            const IVerticalDivider(),
          ],
        ),
        title: Text(
          text,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
