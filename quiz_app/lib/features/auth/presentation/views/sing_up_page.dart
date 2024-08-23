import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/text_divider.dart';
import '../../../../core/extensions/context_extension.dart';
import '../refactors/sign_up_form.dart';
import 'sign_in_page.dart';
import '../widgets/auth_redirect_button.dart';
import '../../../../generated/l10n.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sing-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      appBar: BasicAppBar(title: S.of(context).signUpAppBarTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
              S.of(context).signUpHeading,
              style: context.textTheme.headlineLarge,
            ),
            SignUpForm(
              formKey: formKey,
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            TextDivider(text: S.of(context).dividerOr),
            const Spacer(),
            AuthRedirectButton(
              text: S.of(context).signUpAlreadyHaveAccount,
              buttonText: S.of(context).loginButton,
              navigateTo: SignInPage.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
