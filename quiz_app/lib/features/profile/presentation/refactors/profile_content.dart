import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/language_provider.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/application/auth_controller.dart';
import '../../application/user_controller.dart';
import '../../domain/user.dart';
import '../widgets/language_radio_button.dart';

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
    var userController = ref.read(userControllerProvider.notifier);
    var authController = ref.read(authControllerProvider.notifier);
    var languageController = ref.read(languageProvider.notifier);
    var selectedValue = ref.watch(languageProvider).languageCode;
    usernameTextController.text = widget.user.userName;

    return Padding(
      padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).profileSubheading,
            style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            textAlign: TextAlign.start,
          ),
          const SmallVSpacer(),
          TextArea(
            hintText: S.of(context).profileNameHint,
            controller: usernameTextController,
            maxLines: 3,
            labelText: S.of(context).profileNameLabel,
          ),
          const SmallVSpacer(),
          Text(
            S.of(context).profileNameDescription,
            style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            textAlign: TextAlign.start,
          ),
          const SmallVSpacer(),
          BasicButton(
            onPressed: () async {
              try {
                await userController.updateUser(
                  user: widget.user.copyWith(userName: usernameTextController.text),
                );
              } catch (_) {
                context.mounted ? showErrorSnackBar(context, S.of(context).somethingWentWrong) : null;
              }
            },
            text: widget.isUsernameUpdating ? S.of(context).profileUpdatingUsername : S.of(context).profileUpdateButton,
          ),
          const ExtraLargeVSpacer(),
          Text(
            S.of(context).profileDeleteButtonLabel,
            style: context.theme.textTheme.headlineSmall,
          ),
          const SmallVSpacer(),
          SecondaryButton(
            onPressed: () async {
              try {
                DeleteDialog(
                  title: S.of(context).profileDeleteDialogHeading,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SmallVSpacer(),
                      Text(
                        S.of(context).profileDeleteDialogDescription,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  onConfirm: () async {
                    await authController.signOut();
                  },
                ).show(context);

                //TOD
              } catch (_) {
                context.mounted ? showErrorSnackBar(context, S.of(context).somethingWentWrong) : null;
              }
            },
            text: S.of(context).profileDeleteButton,
            bgColor: AppColorScheme.error,
            contentColor: AppColorScheme.textContrast,
          ),
          const ExtraLargeVSpacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).language,
                style: context.theme.textTheme.headlineSmall!,
              ),
              const MediumVSpacer(),
              LanguageRadioButton(
                value: 'en',
                groupValue: selectedValue,
                title: S.of(context).languageEnglish,
                onChanged: (value) {
                  languageController.setLocale(const Locale('en'));
                },
              ),
              const MediumVSpacer(),
              LanguageRadioButton(
                value: 'pl',
                groupValue: selectedValue,
                title: S.of(context).languagePolish,
                onChanged: (value) {
                  languageController.setLocale(const Locale('pl'));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  showErrorSnackBar(BuildContext context, String profileSomethingWentWrong) {}
}
