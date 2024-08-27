import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../dashboard/presentation/views/dashboard_page.dart';
import '../../../../generated/l10n.dart';

class QuizzSuccessPage extends StatelessWidget {
  const QuizzSuccessPage({super.key});
  //TODO: Replace with actual link
  final String mockLink = 'link.com/custom-code';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(top: 0), //TODO: Remove top padding if needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).quizzCreationSuccessHeading,
            style: context.textTheme.headlineLarge,
          ),
          const SmallVSpacer(),
          Text(
            S.of(context).quizzCreationSuccessSubheading,
            style: context.textTheme.bodyMedium,
          ),
          const ExtraLargeVSpacer(),
          Container(
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
                  mockLink,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: mockLink));
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
          ),
          const ExtraLargeVSpacer(),
          BasicButton(
            onPressed: () {},
            text: S.of(context).quizzCreationSuccessShareButton,
            width: double.infinity,
          ),
          const MediumVSpacer(),
          SecondaryButton(
            onPressed: () {
              AppRouter().push(const DashboardRoute());
            },
            text: S.of(context).quizzCreationSuccessBackButton,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
