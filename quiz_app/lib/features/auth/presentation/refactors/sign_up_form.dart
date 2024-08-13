import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/res/media_res.dart';

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
              labelText: 'Username',
              hintText: 'Your username',
              required: true,
              obscureText: false,
              controller: widget.usernameController,
            ),
            const SizedBox(
              height: 16,
            ),
            IFormField(
              labelText: 'E-mail',
              hintText: 'Your e-mail',
              required: true,
              obscureText: false,
              controller: widget.emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            IFormField(
              labelText: 'Password',
              hintText: 'Your password',
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
            const SizedBox(
              height: 40,
            ),
            BasicButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {}
              },
              text: 'Register',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
