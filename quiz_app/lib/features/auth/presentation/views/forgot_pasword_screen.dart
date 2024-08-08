import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/auth_form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = '/forgot-password';

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Password reset'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot pasword?',
              style: context.textTheme.headlineLarge,
            ).addPadding(padding: const EdgeInsets.only(bottom: 8)),
            Text(
              'Don\'t worry! It happens. Enter the email address associated with your account.',
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColorScheme.textSecondary),
            ).addPadding(padding: const EdgeInsets.only(bottom: 32)),
            Form(
              key: formKey,
              child: AuthFormField(
                labelText: 'E-mail',
                hintText: 'Your e-mail',
                obscureText: false,
                required: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ).addPadding(padding: const EdgeInsets.only(bottom: 40)),
            ),
            BasicButton(
              text: 'Send e-mail',
              onPressed: () {
                formKey.currentState!.validate();
                kDebugMode ? debugPrint(emailController.text) : null;
              },
              width: double.infinity,
            )
          ],
        ).addPadding(padding: const EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
