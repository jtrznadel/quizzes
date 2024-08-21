import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/errors/file_read_exception.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/generated/l10n.dart';

import '../../../../core/services/file_reader.dart';

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
              S.of(context).quizzCreationTextPromptHeading,
              style: context.textTheme.headlineLarge,
            ),
            Text(
              S.of(context).quizzCreationTextPromptSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            TextArea(
              labelText: S.of(context).quizzCreationTextPromptTextAreaLabel,
              hintText: S.of(context).quizzCreationTextPromptTextAreaHint,
              minLines: 3,
              maxLines: 3,
              required: true,
              controller: _promptController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppTheme.pageDefaultSpacingSize),
              child: TextDivider(
                text: S.of(context).dividerOr,
                color: AppColorScheme.textSecondary,
              ),
            ),
            SecondaryButton(
              onPressed: () async {
                try {
                  final text = await FileReader.pickFileAndRead();
                  _promptController.text = text;
                } on FileReadException catch (exception) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Something went wrong"),
                      ),
                    );
                  }
                  else{
                    kDebugMode ? debugPrint(exception.toString()) : null;
                  }
                }
              },
              text: S.of(context).quizzCreationUploadFile,
              icon: SvgPicture.asset(
                MediaRes.uploadFile,
              ),
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
              text: S.of(context).continueButton,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
