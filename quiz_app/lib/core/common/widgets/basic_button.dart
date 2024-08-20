import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.icon,
    this.iconAlignment,
    this.contentAlignment = MainAxisAlignment.center,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final MainAxisAlignment contentAlignment;
  final contentColor = AppColorScheme.textContrast;

  @override
  Widget build(BuildContext context) {
    return buttonContainer(
      context,
      buttonContent(context),
    );
  }

  Widget buttonContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: contentAlignment,
      children: [
        iconAlignment == IconAlignment.start
            ? icon?.addPadding(padding: const EdgeInsets.only(right: 8)) ?? Container()
            : Container(),
        Text(
          text,
          style:
              context.theme.textTheme.labelLarge!.copyWith(color: contentColor),
        ),
        IconAlignment.end == iconAlignment
            ? icon?.addPadding(padding: const EdgeInsets.only(left: 8)) ?? Container()
            : Container(),
      ],
    ).addPadding(padding: const EdgeInsets.symmetric(vertical: 12));
  }

  Widget buttonContainer(BuildContext context, Widget button) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorScheme.primaryDark,
          width: 1,
        ),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColorScheme.primary,
            AppColorScheme.primaryLight,
          ],
        ),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          splashColor: AppColorScheme.primaryDark,
          highlightColor: AppColorScheme.primaryDark,
          child: button.addPadding(padding: const EdgeInsets.symmetric(horizontal: 16)),
        ),
      ),
    );
  }
}
