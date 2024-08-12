import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

class AddNewQuestionBottomSheet extends StatelessWidget {
  const AddNewQuestionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Add new question",
            style: context.theme.textTheme.headlineMedium,
          ).addPadding(
            padding: const EdgeInsets.only(top: 24),
          ),
        ],
      ),
    );
  }

  //TODO: add return type to get question add mode (manual, AI generated)
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddNewQuestionBottomSheet(),
    );
  }
}
