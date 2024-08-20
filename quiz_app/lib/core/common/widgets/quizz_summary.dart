import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class QuizzSummary extends StatelessWidget {
  const QuizzSummary({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColorScheme.surfaceContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              S.of(context).quizzSummaryTitle + title,
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
