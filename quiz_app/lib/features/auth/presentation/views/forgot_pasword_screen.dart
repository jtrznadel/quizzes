import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/auth/presentation/views/successful_password_reset_request_screen.dart';

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
      appBar: const BasicAppBar(title: StringRes.forgotPasswordAppbarTitle),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringRes.forgotPasswordHeading,
              style: context.textTheme.headlineLarge,
            ).addPadding(padding: const EdgeInsets.only(bottom: 8)),
            Text(
              StringRes.forgotPasswordSubheading,
              style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            ).addPadding(padding: const EdgeInsets.only(bottom: 32)),
            Form(
              key: formKey,
              child: IFormField(
                labelText: StringRes.forgotPasswordInputLabel,
                hintText: StringRes.forgotPasswordInputHint,
                obscureText: false,
                required: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ).addPadding(padding: const EdgeInsets.only(bottom: 40)),
            ),
            BasicButton(
              text: StringRes.forgotPasswordButton,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.navigator.pushReplacementNamed(SuccessfulPasswordResetRequestScreen.routeName);
                }
              },
              width: double.infinity,
            )
          ],
        ).addPadding(padding: const EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
