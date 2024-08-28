import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/application/auth_controller.dart';
import '../../../auth/application/auth_state.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: replace with actual user name
    var controller = TextEditingController.fromValue(
      const TextEditingValue(text: 'John Doe'),
    );

    var authController = ref.read(authControllerProvider.notifier);
    var state = ref.watch(authControllerProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state == const AuthState.unauthenticated()) {
        context.router.replaceAll([const SignInRoute()]);
      }
    });

    return Scaffold(
      appBar: BasicAppBar(title: S.of(context).profileAppbarTitle),
      body: Center(
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
              controller: controller,
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
              onPressed: () {},
              text: S.of(context).profileUpdateButton,
            ),
            const ExtraLargeVSpacer(),
            Text(
              S.of(context).profileDeleteButtonLabel,
              style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            ),
            const SmallVSpacer(),
            SecondaryButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteDialog(
                    title: S.of(context).deleteAccountHeading,
                    content: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppTheme.profileScreenDeleteAccountDialogTextPadding),
                      child: Text(
                        S.of(context).deleteAccountDescription,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                    ),
                    onConfirm: () async {
                      await authController.signOut();
                    },
                  ),
                );
              },
              text: S.of(context).profileDeleteButton,
              bgColor: AppColorScheme.error,
              contentColor: AppColorScheme.textContrast,
            ),
          ],
        ).addPadding(padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize)),
      ),
    );
  }
}
