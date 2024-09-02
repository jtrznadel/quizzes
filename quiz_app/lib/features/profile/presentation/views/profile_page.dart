import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/dialogs/delete_dialog.dart';
import '../../../../core/errors/refresh_token_missing_exception.dart';
import '../../../../core/services/language_provider.dart';
import '../../../../generated/l10n.dart';
import '../../application/user_controller.dart';
import '../../application/user_state.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/common/widgets/text_area.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/application/auth_controller.dart';
import '../../../auth/application/auth_state.dart';
import '../../domain/user.dart';
import '../refactors/profile_content.dart';
import '../widgets/language_radio_button.dart';

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
              orElse: () {
                return const CircularProgressIndicator();
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
        //TODO: navigate to sign in page
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
