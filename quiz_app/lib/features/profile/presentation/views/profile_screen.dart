import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/errors/refresh_token_missing_exception.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/views/welcome_screen.dart';
import '../../application/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: S.of(context).profileAppbarTitle),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(userControllerProvider);
            final userController = ref.read(userControllerProvider.notifier);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state.when(
                  loading: (isUsernameUpdating) {
                    return const CircularProgressIndicator();
                  },
                  error: (error, isUsernameUpdating) {
                    handleError(error, context);
                    //TODO: replace with custom error widget
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).profileSomethingWentWrong,
                            style: context.theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () {
                              userController.getUser();
                            },
                            icon: const Icon(Icons.refresh),
                          )
                        ],
                      ),
                    );
                  },
                  success: (user, isUsernameUpdating) {
                    var controller = TextEditingController.fromValue(
                        TextEditingValue(text: user.userName));
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).profileSubheading,
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: AppColorScheme.textSecondary),
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
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: AppColorScheme.textSecondary),
                          textAlign: TextAlign.start,
                        ),
                        const SmallVSpacer(),
                        BasicButton(
                          onPressed: () async {
                            try {
                              await userController.updateUser(
                                user: user.copyWith(userName: controller.text),
                              );
                            } on Exception catch (error) {
                              context.mounted? handleError(error, context) : null;
                            } catch (_){
                              context.mounted ? showErrorSnackBar(
                                  context, S.of(context).profileSomethingWentWrong) : null;
                            }
                          },
                          text: isUsernameUpdating ? S.of(context).profileUpdatingUsername : S.of(context).profileUpdateButton,
                        ),
                        const ExtraLargeVSpacer(),
                        Text(
                          S.of(context).profileDeleteButtonLabel,
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: AppColorScheme.textSecondary),
                        ),
                        const SmallVSpacer(),
                        SecondaryButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => DeleteDialog(
                                title: S.of(context).deleteAccountHeading,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppTheme
                                          .profileScreenDeleteAccountDialogTextPadding),
                                  child: Text(
                                    S.of(context).deleteAccountDescription,
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                ),
                                onConfirm: () {},
                              ),
                            );
                          },
                          text: S.of(context).profileDeleteButton,
                          bgColor: AppColorScheme.error,
                          contentColor: AppColorScheme.textContrast,
                        ),
                      ],
                    ).addPadding(
                      padding:
                          const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void handleError(Exception error, BuildContext context) {
    if (error is RefreshTokenMissingException) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(WelcomeScreen.routeName, (route) => false);
        showErrorSnackBar(context, S.of(context).sessionExpired);
      });
    } else {
      showErrorSnackBar(context, S.of(context).profileSomethingWentWrong);
    }
  }

  void showErrorSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
  }
}
