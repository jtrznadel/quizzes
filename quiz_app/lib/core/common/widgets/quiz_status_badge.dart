import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

class QuizStatusBadge extends StatelessWidget {
  const QuizStatusBadge({super.key, required this.text, required this.backgroundColor, required this.textColor, this.leadingIcon});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          if (leadingIcon != null) Icon(leadingIcon, color: textColor).addPadding(padding: const EdgeInsets.only(right: 8)),
          Text(text, style: context.theme.textTheme.labelMedium!.copyWith(color: textColor)).addPadding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        ],
      ),
    );
  }
}