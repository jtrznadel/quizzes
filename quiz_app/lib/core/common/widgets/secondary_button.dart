
import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.width,
      this.leadingIcon,
      this.trailingIcon,
      this.contentAlignment = MainAxisAlignment.center,
      });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final MainAxisAlignment contentAlignment;
  final contentColor = AppColorScheme.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColorScheme.secondary,
          overlayColor: AppColorScheme.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          shadowColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
        ),
        child: buttonContent(contentAlignment, text, context, leadingIcon: leadingIcon, trailingIcon: trailingIcon)
            .addPadding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
      ),
    );
  }

  Widget buttonContent(MainAxisAlignment contentAlignment, String text,
      BuildContext context, {IconData? leadingIcon, IconData? trailingIcon}) {
    if (leadingIcon != null) {
      return Row(
        mainAxisAlignment: contentAlignment,
        children: [
          Icon(leadingIcon, color: contentColor)
              .addPadding(padding: const EdgeInsets.only(right: 8)),
          Text(
            text,
            style: context.theme.textTheme.labelLarge!
                .copyWith(color: contentColor),
          ),
        ],
      );
    } 
    else if (trailingIcon != null) {
      return Row(
        mainAxisAlignment: contentAlignment,
        children: [
          Text(
            text,
            style: context.theme.textTheme.labelLarge!
                .copyWith(color: contentColor),
          ),
          Icon(trailingIcon, color: contentColor)
              .addPadding(padding: const EdgeInsets.only(left: 8)),
        ],
      );
    }
    else {
      return Row(
        mainAxisAlignment: contentAlignment,
        children: [
          Text(
            text,
            style: context.theme.textTheme.labelLarge!
                .copyWith(color: contentColor),
          ),
        ],
      );
    }
  }
}
