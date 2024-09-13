import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/services/app_router.dart';
import '../../application/auth_controller.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../generated/l10n.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
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
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.read(authControllerProvider.notifier);
        final state = ref.watch(authControllerProvider);
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IFormField(
                  controller: emailController,
                  labelText: S.of(context).emailLabel,
                  hintText: S.of(context).emailHint,
                  obscureText: false,
                ),
                const MediumVSpacer(),
                IFormField(
                  controller: passwordController,
                  labelText: S.of(context).passwordLabel,
                  hintText: S.of(context).passwordHint,
                  obscureText: obscurePassword,
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
                TextButton(
                  onPressed: () {
                    ref.read(appRouterProvider).push(const ForgotPasswordRoute());
                  },
                  child: Text(
                    S.of(context).forgotPassword,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                const ExtraLargeVSpacer(),
                state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  authenticated: () {
                    context.router.replaceAll([const DashboardRoute()]);
                    return const SizedBox.shrink();
                  },
                  error: (message) => _errorAction(controller, context),
                  orElse: () => _loginButton(controller, context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _errorAction(AuthController controller, BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ErrorSnackbar.show(
        context,
        S.of(context).invalidEmailOrPassword,
      ),
    );
    return _loginButton(controller, context);
  }

  BasicButton _loginButton(AuthController controller, BuildContext context) {
    return BasicButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          controller.signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
        }
      },
      text: S.of(context).loginButton,
      width: double.infinity,
    );
  }
}
