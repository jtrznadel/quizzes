import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/spacers/horizontal_spacers.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.text,
    this.color = AppColorScheme.border,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color,
              height: 1,
            ),
          ),
          const SmallHSpacer(),
          Text(
            text,
            style: context.textTheme.labelSmall!.copyWith(
              color: color,
            ),
          ),
          const MediumHSpacer(),
          Expanded(
            child: Divider(
              color: color,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
