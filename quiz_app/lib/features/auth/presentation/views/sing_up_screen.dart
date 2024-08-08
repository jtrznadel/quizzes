import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/auth/presentation/refactors/sign_up_form.dart';
import 'package:quiz_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:quiz_app/features/auth/presentation/widgets/auth_redirect_button.dart';

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
            SignUpForm(
              formKey: formKey,
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            const TextDivider(text: 'OR'),
            const Spacer(),
            const AuthRedirectButton(
              text: StringRes.signUpAlready,
              buttonText: 'Log In',
              navigateTo: SignInScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
