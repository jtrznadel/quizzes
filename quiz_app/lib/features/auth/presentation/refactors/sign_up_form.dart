import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/validators/validators.dart';
import '../../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/info_snackbar.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../application/auth_controller.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(authControllerProvider.notifier);
    final state = ref.watch(authControllerProvider);
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
            IFormField(
              labelText: S.of(context).passwordLabel,
              hintText: S.of(context).passwordHint,
              obscureText: obscurePassword,
              controller: passwordController,
              validator: passwordValidator,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: obscurePassword
                    ? SvgPicture.asset(
                        MediaRes.fluentEye,
                        fit: BoxFit.scaleDown,
                      )
                    : SvgPicture.asset(
                        MediaRes.fluentEye,
                        fit: BoxFit.scaleDown,
                      ),
              ),
            ),
            const ExtraLargeVSpacer(),
            state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => _successAction(controller, context),
              error: (message) => _errorAction(controller, context),
              orElse: () => _registerButton(controller, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorAction(AuthController controller, BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ErrorSnackbar.show(
        context,
        S.of(context).somethingWentWrong,
      ),
    );
    return _registerButton(controller, context);
  }

  Widget _successAction(AuthController controller, BuildContext context) {
    emailController.clear();
    passwordController.clear();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => InfoSnackbar.show(
        context,
        color: AppColorScheme.success,
        S.of(context).successfulRegistration,
      ),
    );
    return _registerButton(controller, context);
  }

  BasicButton _registerButton(AuthController controller, BuildContext context) {
    return BasicButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          controller.signUp(
            email: emailController.text,
            password: passwordController.text,
          );
        }
      },
      text: S.of(context).registerButton,
      width: double.infinity,
    );
  }
}
