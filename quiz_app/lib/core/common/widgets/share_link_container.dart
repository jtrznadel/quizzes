import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';
import '../../extensions/context_extension.dart';
import '../../res/media_res.dart';
import '../../theme/app_color_scheme.dart';
import 'info_snackbar.dart';

class ShareLinkContainer extends StatelessWidget {
  const ShareLinkContainer({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            link,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              context.maybePop();
              Clipboard.setData(ClipboardData(text: link));
              InfoSnackbar.show(context, S.of(context).linkCopied, color: AppColorScheme.primary);
            },
            icon: SvgPicture.asset(
              MediaRes.copy,
              colorFilter: const ColorFilter.mode(
                AppColorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
