import 'package:flutter/material.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import 'successful_password_reset_request_screen.dart';
import '../../../../generated/l10n.dart';

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
      appBar: BasicAppBar(title: S.of(context).forgotPasswordAppbarTitle),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).forgotPasswordHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              S.of(context).forgotPasswordSubheading,
              style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            ),
            const LargeVSpacer(),
            Form(
              key: formKey,
              child: IFormField(
                labelText: S.of(context).forgotPasswordInputLabel,
                hintText: S.of(context).forgotPasswordInputHint,
                obscureText: false,
                required: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const ExtraLargeVSpacer(),
            BasicButton(
              text: S.of(context).forgotPasswordButton,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.navigator.pushReplacementNamed(SuccessfulPasswordResetRequestScreen.routeName);
                }
              },
              width: double.infinity,
            )
          ],
        ).addPadding(padding: const EdgeInsets.symmetric(horizontal: AppTheme.pageDefaultSpacingSize)),
      ),
    );
  }
}
