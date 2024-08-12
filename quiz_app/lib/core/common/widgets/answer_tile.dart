import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/vertical_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({super.key, required this.leading, required this.text});

  final String text;
  final String leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'A',
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(
              width: 16,
            ),
            const IVerticalDivider(),
          ],
        ),
        title: Text(
          text,
          style: context.textTheme.bodyMedium,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
