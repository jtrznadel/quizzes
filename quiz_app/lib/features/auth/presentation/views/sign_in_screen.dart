import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/features/auth/presentation/refactors/sign_in_form.dart';
import 'package:quiz_app/features/auth/presentation/views/sing_up_screen.dart';
import 'package:quiz_app/features/auth/presentation/widgets/auth_redirect_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BasicAppBar(
        title: 'Login',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter credentials',
              style: context.textTheme.headlineLarge,
            ),
            SignInForm(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
            ),
            const TextDivider(text: 'OR'),
            const Spacer(),
            const AuthRedirectButton(
              text: StringRes.signInDonHave,
              buttonText: 'Register',
              navigateTo: SignUpScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
