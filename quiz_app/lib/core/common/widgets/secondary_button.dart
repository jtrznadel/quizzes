import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

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
      ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        label: Text(
          text,
          style: context.theme.textTheme.labelLarge!.copyWith(
            color: contentColor,
          ),
        ),
        icon: icon,
        iconAlignment: iconAlignment!,
      ),
    );
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
