import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/features/auth/application/auth_controller.dart';
import 'package:quiz_app/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(authControllerProvider);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                IFormField(
                  labelText: S.of(context).usernameLabel,
                  hintText: S.of(context).usernameHint,
                  required: true,
                  obscureText: false,
                  controller: widget.usernameController,
                ),
                const MediumVSpacer(),
                IFormField(
                  labelText: S.of(context).emailLabel,
                  hintText: S.of(context).emailHint,
                  required: true,
                  obscureText: false,
                  controller: widget.emailController,
                ),
                const MediumVSpacer(),
                IFormField(
                  labelText: S.of(context).passwordLabel,
                  hintText: S.of(context).passwordHint,
                  required: true,
                  obscureText: obscurePassword,
                  controller: widget.passwordController,
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
                //TODO: Replace after testing
                state.when(
                  initial: () => BasicButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        ref.read(authControllerProvider.notifier).signUp(
                            username: widget.usernameController.text,
                            email: widget.emailController.text,
                            password: widget.passwordController.text);
                      }
                    },
                    text: S.of(context).registerButton,
                    width: double.infinity,
                  ),
                  loading: () => const CircularProgressIndicator(),
                  success: () => const Text('Dziala super'),
                  error: (message) => const Text('Nie dziala super'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
