import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/refresh_token_missing_exception.dart';
import '../../../../generated/l10n.dart';
import '../../application/user_controller.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../auth/application/auth_controller.dart';
import '../../../auth/application/auth_state.dart';
import '../refactors/profile_content.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userControllerProvider.notifier).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userController = ref.read(userControllerProvider.notifier);
    final state = ref.watch(userControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);

    if (authState == const AuthState.unauthenticated()) {
      ref.read(appRouterProvider).replaceAll([const SignInRoute()]);
    }
<<<<<<< HEAD

=======
>>>>>>> dev
    return Scaffold(
      appBar: BasicAppBar(
        title: S.of(context).profileAppbarTitle,
        actions: [
          IconButton(
            onPressed: () async {
              await authController.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            state.maybeWhen(
              success: (user, isUsernameUpdating) => ProfileContent(
                user: user,
                isUsernameUpdating: isUsernameUpdating,
              ),
              error: (error) {
                handleError(error, context);
                //TODO: replace with custom error widget
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).somethingWentWrong,
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
<<<<<<< HEAD
              success: (user, isUsernameUpdating) {
                var controller = TextEditingController.fromValue(TextEditingValue(text: user.userName));
                return Column(
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
                      onPressed: () async {
                        try {
                          await userController.updateUser(
                            user: user.copyWith(userName: controller.text),
                          );
                        } catch (_) {
                          context.mounted ? showErrorSnackBar(context, S.of(context).somethingWentWrong) : null;
                        }
                      },
                      text: isUsernameUpdating ? S.of(context).profileUpdatingUsername : S.of(context).profileUpdateButton,
                    ),
                    const ExtraLargeVSpacer(),
                    Text(
                      S.of(context).profileSignOutDescription,
                      style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
                    ),
                    const SmallVSpacer(),
                    SecondaryButton(
                      onPressed: () async {
                        try {
                          await authController.signOut();
                        } catch (_) {
                          context.mounted ? showErrorSnackBar(context, S.of(context).somethingWentWrong) : null;
                        }
                      },
                      text: S.of(context).profileSignOutButton,
                      bgColor: AppColorScheme.error,
                      contentColor: AppColorScheme.textContrast,
                    ),
                  ],
                ).addPadding(
                  padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
                );
=======
              orElse: () {
                return const CircularProgressIndicator();
>>>>>>> dev
              },
            ),
          ],
        ),
      ),
    );
  }

  void handleError(Exception error, BuildContext context) {
    if (error is RefreshTokenMissingException) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorSnackBar(context, S.of(context).sessionExpired);
      });
    } else {
      showErrorSnackBar(context, S.of(context).somethingWentWrong);
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
