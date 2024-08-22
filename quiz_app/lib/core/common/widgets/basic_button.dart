import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'spacers/horizontal_spacers.dart';
import '../../extensions/add_padding_extension.dart';
import '../../extensions/context_extension.dart';
import '../../theme/app_color_scheme.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.icon,
    this.iconAlignment = IconAlignment.start,
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
        const LargeHSpacer(),
        iconAlignment == IconAlignment.start ? icon?? Container() : Container(),
        iconAlignment == IconAlignment.start ? const SmallHSpacer() : Container(),
        Text(
          text,
          style: context.theme.textTheme.labelLarge!.copyWith(color: contentColor),
        ),
        iconAlignment == IconAlignment.end ? const SmallHSpacer() : Container(),
        iconAlignment == IconAlignment.end ? icon?? Container() : Container(),
        const LargeHSpacer(),
      ],
    ).addPadding(padding: const EdgeInsets.symmetric(vertical: AppTheme.buttonVerticalPadding));
  }

  Widget buttonContainer(BuildContext context, Widget button) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorScheme.primaryDark,
          width: AppTheme.buttonBorderWidth,
        ),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColorScheme.primary,
            AppColorScheme.primaryLight,
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.buttonBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.buttonBorderRadius),
          ),
          splashColor: AppColorScheme.primaryDark,
          highlightColor: AppColorScheme.primaryDark,
          child: button,
        ),
      ),
    );
  }
}
