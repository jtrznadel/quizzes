import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../extensions/context_extension.dart';
import '../../res/media_res.dart';

class IBackButton extends StatelessWidget {
  const IBackButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
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
