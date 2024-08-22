import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/res/media_res.dart';
import '../../../../generated/l10n.dart';

class SignUpForm extends StatefulWidget {
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
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
            BasicButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {}
              },
              text: S.of(context).registerButton,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
