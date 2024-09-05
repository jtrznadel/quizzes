import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/language_provider.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../domain/user.dart';
import 'action_profile_section.dart';
import 'language_profile_section.dart';

class ProfileContent extends ConsumerStatefulWidget {
  const ProfileContent({super.key, required this.user, required this.isUsernameUpdating});
  final User user;
  final bool isUsernameUpdating;

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent> {
  var usernameTextController = TextEditingController();

  @override
  void dispose() {
    usernameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedValue = ref.watch(languageProvider).languageCode;
    usernameTextController.text = widget.user.userName;

    return Padding(
      padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).profileSubheading,
            style: context.theme.textTheme.headlineMedium,
            textAlign: TextAlign.start,
          ),
          const SmallVSpacer(),
          TextArea(
            hintText: S.of(context).profileNameHint,
            controller: usernameTextController,
            maxLines: 3,
            labelText: S.of(context).profileEmailLabel,
            enabled: false,
          ),
          const SmallVSpacer(),
          TextArea(
            hintText: S.of(context).profileNameHint,
            controller: usernameTextController,
            maxLines: 3,
            labelText: S.of(context).profileNameLabel,
          ),
          const CustomVSpacer(AppTheme.profileSpacerValue),
          LanguageProfileSection(selectedValue: selectedValue),
          const CustomVSpacer(AppTheme.profileSpacerValue),
          const ActionProfileSection(),
        ],
      ),
    );
  }
}
