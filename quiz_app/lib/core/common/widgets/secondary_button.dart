import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.contentAlignment = MainAxisAlignment.center,
    this.bgColor = AppColorScheme.secondary,
    this.contentColor = AppColorScheme.primary,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final MainAxisAlignment contentAlignment;
  final Color? bgColor;
  final Color? contentColor;

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
        color: bgColor,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          splashColor: contentColor!.withOpacity(0.2),
          highlightColor: contentColor!.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: contentAlignment,
            children: [button],
          ),
        ),
      ),
    );
  }
}
