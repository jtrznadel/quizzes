import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/generated/l10n.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    this.minLines = 1,
    this.maxLines,
    this.required = true,
    this.contentPadding = AppTheme.pageDefaultSpacingSize,
    this.textStyle,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final int minLines;
  final int? maxLines;
  final bool required;
  final double contentPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            RichText(
              text: TextSpan(
                text: labelText,
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: required ? '*' : '',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
            const SmallVSpacer(),
          ],
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (required && (value == null || value.trim().isEmpty)) {
                  return S.of(context).thisFieldIsRequired;
                }
                return null;
              },
              minLines: minLines,
              maxLines: maxLines,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(contentPadding).copyWith(top: 0),
                hintText: hintText,
                hintStyle: textStyle ?? context.textTheme.bodyMedium,
              ),
              style: textStyle ?? context.textTheme.bodyMedium,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
