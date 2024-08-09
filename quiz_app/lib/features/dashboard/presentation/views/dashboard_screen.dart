import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringRes.dashboardTopHeading,
                  style: context.theme.textTheme.headlineLarge,
                ),
                IconButton(
                  onPressed: () {
                    //TODO: open user profile
                  },
                  icon: SvgPicture.asset(MediaRes.userProfile,
                      width: 24, height: 24),
                )
              ],
            ).addPadding(
              padding: const EdgeInsets.only(bottom: 8),
            ),
            Text(
              StringRes.dashboardSubheading,
              style: context.theme.textTheme.bodyMedium!
                  .copyWith(color: AppColorScheme.textSecondary),
            )
          ],
        ),
      ).addPadding(
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
