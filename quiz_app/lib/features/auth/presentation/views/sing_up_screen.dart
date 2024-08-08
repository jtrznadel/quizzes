import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/auth_form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/auth/presentation/views/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sing-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BasicAppBar(title: 'Register'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
              StringRes.signUpHeading,
              style: context.textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthFormField(
                      labelText: 'Username',
                      hintText: 'Your username',
                      required: true,
                      obscureText: false,
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthFormField(
                      labelText: 'E-mail',
                      hintText: 'Your e-mail',
                      required: true,
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthFormField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      required: true,
                      obscureText: obscurePassword,
                      controller: passwordController,
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
                        if (formKey.currentState!.validate()) {}
                      },
                      text: 'Register',
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
            const TextDivider(text: 'OR'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringRes.signUpAlready,
                    style: context.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      context.navigator.pushReplacementNamed(SignInScreen.routeName);
                    },
                    child: Text(
                      'Log In',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
