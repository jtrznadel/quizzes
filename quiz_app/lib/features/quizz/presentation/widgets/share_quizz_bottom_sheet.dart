import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/share_link_container.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../../mocks.dart';

class ShareQuizzBottomSheet extends ConsumerWidget {
  const ShareQuizzBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize).copyWith(top: AppTheme.pageDefaultTopPaddingSize),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).quizzShareHeading,
                style: context.theme.textTheme.headlineMedium,
              ),
              const SmallVSpacer(),
              //TODO: Replace with actual link
              const ShareLinkContainer(link: mockLink),
              const MediumVSpacer(),
              SecondaryButton(
                onPressed: () async {
                  await Share.share(S.of(context).quizzShareMessage);
                },
                text: S.of(context).quizzShareButton,
                width: double.infinity,
              ),
              const ExtraLargeVSpacer(),
              SecondaryButton(
                onPressed: () {
                  ref.read(appRouterProvider).maybePop();
                },
                text: S.of(context).cancelButton,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const Wrap(
        children: [
          ShareQuizzBottomSheet(),
        ],
      ),
    );
  }
}
