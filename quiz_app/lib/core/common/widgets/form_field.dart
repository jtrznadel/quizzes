import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class IFormField extends StatelessWidget {
  const IFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.required = true,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.bgColor = AppColorScheme.dialogBackground,
    required this.controller,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool required;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (required && (value == null || value.isEmpty)) {
                    return S.of(context).thisFieldIsRequired;
                  }
                  return null;
                },
                obscureText: obscureText,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                ),
                style: context.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
