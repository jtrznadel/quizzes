import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../views/forgot_pasword_page.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../generated/l10n.dart';

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
                context.navigator.pushNamed(ForgotPasswordPage.routeName);
              },
              child: Text(
                S.of(context).forgotPassword,
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ),
            const ExtraLargeVSpacer(),
            BasicButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {}
                },
                text: S.of(context).loginButton,
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
