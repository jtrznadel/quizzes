import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/application/auth_controller.dart';

@RoutePage()
class CreateGuestUserPage extends ConsumerStatefulWidget {
  const CreateGuestUserPage({super.key, required this.joinCode});

  final String joinCode;

  @override
  ConsumerState<CreateGuestUserPage> createState() =>
      _CreateGuestUserPageState();
}

class _CreateGuestUserPageState extends ConsumerState<CreateGuestUserPage> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: BasicAppBar(
          title: 'Guest login',
          onBack: () {
            ref.read(appRouterProvider).replaceAll([const WelcomeRoute()]);
          }),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the quiz!',
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              'Provider your username to join the quiz.',
              style: context.textTheme.bodyMedium,
            ),
            const LargeVSpacer(),
            Form(
              key: formKey,
              child: IFormField(
                labelText: 'Username',
                hintText: 'Enter your username',
                controller: usernameController,
              ),
            ),
            const LargeVSpacer(),
            BasicButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final authController =
                      ref.read(authControllerProvider.notifier);
                  final success = await authController.guestSignIn(
                      username: usernameController.text);
                  if (success) {
                    ref.read(appRouterProvider).push(
                      TakeQuizzRoute(joinCode: widget.joinCode),
                    );
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to join the quiz'),
                        ),
                      );
                    }
                  }
                }
              },
              text: 'Start Quizz',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
