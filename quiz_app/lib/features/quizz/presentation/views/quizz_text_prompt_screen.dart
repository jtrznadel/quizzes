import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class QuizzTextPromptScreen extends StatefulWidget {
  const QuizzTextPromptScreen({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<QuizzTextPromptScreen> createState() => _QuizzTextPromptScreenState();
}

class _QuizzTextPromptScreenState extends State<QuizzTextPromptScreen> {
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringRes.quizzCreationTextPromptHeading,
              style: context.textTheme.headlineLarge,
            ),
            Text(
              StringRes.quizzCreationTextPromptSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            TextArea(
              labelText: StringRes.quizzCreationTextPromptTextAreaLabel,
              hintText: StringRes.quizzCreationTextPromptTextAreaHint,
              minLines: 3,
              maxLines: 3,
              required: true,
              controller: _promptController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppTheme.pageDefaultSpacingSize),
              child: TextDivider(
                text: StringRes.dividerOr,
                color: AppColorScheme.textSecondary,
              ),
            ),
            SecondaryButton(
              onPressed: () {},
              text: StringRes.quizzCreationUploadFile,
              //TODO: fix button to be able to take svg as icon
              width: double.infinity,
            ),
            const SizedBox(
              height: 40,
            ),
            BasicButton(
              onPressed: () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              text: StringRes.continueButton,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
