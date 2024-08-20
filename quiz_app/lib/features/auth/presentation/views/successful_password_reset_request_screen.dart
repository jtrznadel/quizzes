import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/generated/l10n.dart';

class SuccessfulPasswordResetRequestScreen extends StatelessWidget {
  const SuccessfulPasswordResetRequestScreen({super.key});

  static const String routeName = '/successful-password-reset-request';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(MediaRes.passwordResetSticker).addPadding(padding: const EdgeInsets.only(bottom: 35)),
            Text(
              S.of(context).successfulPasswordResetRequestHeading,
              style: context.textTheme.headlineMedium,
            ).addPadding(padding: const EdgeInsets.only(bottom: 10)),
            SizedBox(
              width: 226,
              child: Text(
                S.of(context).successfulPasswordResetRequestSubheading,
                style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
                textAlign: TextAlign.center,
              ),
            ).addPadding(padding: const EdgeInsets.only(bottom: 18)),
            BasicButton(
              text: S.of(context).successfulPasswordResetRequestButton,
              onPressed: () {
                Navigator.of(context).pop();
              },
              width: double.infinity,
            )
          ],
        ).addPadding(padding: const EdgeInsets.symmetric(horizontal: 25)),
      ),
    );
  }
}
