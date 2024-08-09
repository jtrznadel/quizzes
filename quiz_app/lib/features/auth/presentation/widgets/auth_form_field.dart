import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.required,
      this.suffixIcon,
      required this.obscureText,
      this.keyboardType,
      required this.controller});

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool required;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: context.textTheme.bodyMedium,
            children: [
              TextSpan(
                text: required ? ' *' : '',
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
                return 'This field is required';
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
    );
  }
}
