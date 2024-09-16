import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../core/common/validators/validators.dart';
import '../../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/info_snackbar.dart';
import '../../../../core/common/widgets/loading_indicator.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../application/auth_controller.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/password_form_field.dart';

class SingUpForm extends ConsumerWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            IFormField(
              labelText: S.of(context).emailLabel,
              hintText: S.of(context).emailHint,
              validator: emailValidator,
              obscureText: false,
              controller: emailController,
            ),
            const MediumVSpacer(),
            PasswordFormField(
                passwordController: passwordController, validate: true),
            const ExtraLargeVSpacer(),
            RegisterButton(
                emailController: emailController,
                passwordController: passwordController)
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends ConsumerWidget {
  const RegisterButton(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authControllerProvider.notifier);
    final state = ref.watch(authControllerProvider);

    return state.maybeWhen(
      loading: (_) => const LoadingIndicator(),
      orElse: () {
        return BasicButton(
          onPressed: () async {
            final success = await controller.signUp(
              email: emailController.text,
              password: passwordController.text,
            );
            if (success) {
              if (context.mounted) {
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) => InfoSnackbar.show(
                    context,
                    color: AppColorScheme.success,
                    S.of(context).successfulRegistration,
                  ),
                );
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) =>
                      ref.read(appRouterProvider).replace(const SignInRoute()),
                );
              }
            } else {
              context.mounted
                  ? SchedulerBinding.instance.addPostFrameCallback(
                      (_) => ErrorSnackbar.show(
                        context,
                        S.of(context).somethingWentWrong,
                      ),
                    )
                  : null;
            }
          },
          text: S.of(context).registerButton,
          width: double.infinity,
        );
      },
    );
  }
}
