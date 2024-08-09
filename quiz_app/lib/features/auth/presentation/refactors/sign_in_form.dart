import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/features/auth/presentation/views/forgot_pasword_screen.dart';
import 'package:quiz_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';

class SignInForm extends StatefulWidget {
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
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AuthFormField(
              controller: widget.emailController,
              labelText: 'E-mail',
              hintText: 'Your e-mail',
              required: true,
              obscureText: false,
            ),
            const SizedBox(
              height: 16,
            ),
            AuthFormField(
              controller: widget.passwordController,
              labelText: 'Password',
              hintText: 'Your password',
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
                context.navigator.pushNamed(ForgotPasswordScreen.routeName);
              },
              child: Text(
                'Forgot password?',
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            BasicButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {}
                },
                text: 'Login',
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
