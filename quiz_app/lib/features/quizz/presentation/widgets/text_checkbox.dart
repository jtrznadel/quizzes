import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class TextCheckbox extends StatelessWidget {
  const TextCheckbox(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged,
      this.height = 24,
      this.width = 24});

  
  final double? height;
  final double? width;
  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      splashColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Row(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
                color: value ? AppColorScheme.primary : Colors.transparent,
              ),
              child: value
                  ? SvgPicture.asset(
                    MediaRes.checkmark,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ).addPadding(padding: const EdgeInsets.all(4.5))
                  : null,
            ),
          ).addPadding(padding: const EdgeInsets.only(right: 12)),
          Text(text, style: context.theme.textTheme.bodyMedium),
        ],
      ).addPadding(padding: const EdgeInsets.symmetric(vertical: 7)),
    );
  }
}
