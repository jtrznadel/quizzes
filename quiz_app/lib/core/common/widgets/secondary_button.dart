import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    this.icon,
    this.iconAlignment,
    this.contentAlignment = MainAxisAlignment.center,
  });

  final VoidCallback onPressed;
  final String text;
  final double width;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final MainAxisAlignment contentAlignment;
  final contentColor = AppColorScheme.primary;

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
          overlayColor: Colors.transparent
        ),
        label: Text(
          text,
          style:
              context.theme.textTheme.labelLarge!.copyWith(color: contentColor),
        ),
        icon: icon,
        iconAlignment: iconAlignment ?? IconAlignment.start,
      ),
    );
  }

  Widget buttonContainer(BuildContext context, Widget button) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColorScheme.secondary,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          splashColor: AppColorScheme.primaryLight.withOpacity(0.2),
          highlightColor: AppColorScheme.primaryLight.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: contentAlignment,
            children: [button],
          ),
        ),
      ),
    );
  }
}
