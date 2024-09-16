import 'package:flutter/material.dart';
import '../../theme/app_color_scheme.dart';
import '../../utils/enums/answer_result_enum.dart';
import 'spacers/horizontal_spacers.dart';
import 'vertical_divider.dart';
import '../../extensions/context_extension.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.leading,
    required this.text,
    this.trailing,
    required this.result,
  });

  final String text;
  final String leading;
  final Widget? trailing;
  final AnswerResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: result.getAnswerBackgroundColor()),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              leading,
              style: context.textTheme.labelMedium!.copyWith(color: result.getAnswerTextColor()),
            ),
            const MediumHSpacer(),
            const IVerticalDivider(),
          ],
        ),
        title: Text(text, style: context.textTheme.bodyMedium!.copyWith(color: result.getAnswerTextColor())),
        trailing: trailing,
      ),
    );
  }
}
