import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/share_link_container.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../mocks.dart';
import '../../../dashboard/presentation/views/dashboard_page.dart';
import '../../../../generated/l10n.dart';

class QuizzSuccessPage extends ConsumerWidget {
  const QuizzSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          //TODO: Replace with actual link
          const ShareLinkContainer(link: mockLink),
          const ExtraLargeVSpacer(),
          BasicButton(
            onPressed: () {},
            text: S.of(context).quizzCreationSuccessShareButton,
            width: double.infinity,
          ),
          const MediumVSpacer(),
          SecondaryButton(
            onPressed: () {
              ref.read(appRouterProvider).push(const DashboardRoute());
            },
            text: S.of(context).quizzCreationSuccessBackButton,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
