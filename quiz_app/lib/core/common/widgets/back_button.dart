import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';

class IBackButton extends StatelessWidget {
  const IBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        MediaRes.arrowBack,
        height: 16,
        width: 8,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(context.theme.primaryColor, BlendMode.srcIn),
      ),
    );
  }
}
