import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  bool obscurePassword = true;

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
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IFormField(
                  controller: widget.emailController,
                  labelText: S.of(context).emailLabel,
                  hintText: S.of(context).emailHint,
                  required: true,
                  obscureText: false,
                ),
                const MediumVSpacer(),
                IFormField(
                  controller: widget.passwordController,
                  labelText: S.of(context).passwordLabel,
                  hintText: S.of(context).passwordHint,
                  required: true,
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
                    AppRouter().push(const ForgotPasswordRoute());
                  },
                  child: Text(
                    S.of(context).forgotPassword,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                const ExtraLargeVSpacer(),
                state.when(
                  initial: () => BasicButton(
                      onPressed: () {
                        if (widget.formKey.currentState!.validate()) {
                          controller.signIn(
                            email: widget.emailController.text.trim(),
                            password: widget.passwordController.text.trim(),
                          );
                        }
                      },
                      text: S.of(context).loginButton,
                      width: double.infinity),
                  loading: () => const CircularProgressIndicator(),
                  success: () => const Text('Dziala super'),
                  error: (message) => const Text('Nie dziala'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
