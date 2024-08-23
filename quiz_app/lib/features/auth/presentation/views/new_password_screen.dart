import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import 'sign_in_screen.dart';
import '../../../../generated/l10n.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  static const String routeName = '/new-password';

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: S.of(context).newPasswordAppbarTitle),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).newPasswordHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              S.of(context).newPasswordSubheading,
              style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            ),
            const LargeVSpacer(),
            Form(
              key: formKey,
              child: IFormField(
                labelText: S.of(context).newPasswordInputLabel,
                hintText: S.of(context).newPasswordInputHint,
                obscureText: obscurePassword,
                required: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: obscurePasswordIconButton(),
              ),
            ),
            const ExtraLargeVSpacer(),
            BasicButton(
              text: S.of(context).newPasswordButton,
              onPressed: () {
                formKey.currentState!.validate();
                context.navigator.pushReplacementNamed(SignInScreen.routeName);
              },
              width: double.infinity,
            )
          ],
        ).addPadding(padding: const EdgeInsets.symmetric(horizontal: AppTheme.pageDefaultSpacingSize)),
      ),
    );
  }

  Widget obscurePasswordIconButton() {
    return IconButton(
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
    );
  }
}
