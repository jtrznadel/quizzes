import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColorScheme.border,
              height: 1,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: context.textTheme.labelSmall!.copyWith(
              color: AppColorScheme.border,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: Divider(
              color: AppColorScheme.border,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
