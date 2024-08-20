import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton(
      {super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.all(Colors.white),
      activeTrackColor: AppColorScheme.primary,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      inactiveTrackColor: AppColorScheme.inactiveSwitchTrackColor,
      thumbIcon: WidgetStateProperty.all(const Icon(null)),
    );
  }
}
