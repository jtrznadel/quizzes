import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/text_divider.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../refactors/sign_in_form.dart';
import '../widgets/auth_redirect_button.dart';
import '../../../../generated/l10n.dart';
import 'sing_up_page.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BasicAppBar(
        title: S.of(context).signInAppBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).signInHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SignInForm(),
            TextDivider(text: S.of(context).dividerOr),
            const Spacer(),
            AuthRedirectButton(
              text: S.of(context).signInDontHaveAccount,
              buttonText: S.of(context).registerButton,
              navigateTo: () => AppRouter().replace(const SignUpRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
