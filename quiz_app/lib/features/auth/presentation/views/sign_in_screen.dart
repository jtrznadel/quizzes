import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/auth_form_field.dart';
import 'package:quiz_app/core/common/widgets/back_button.dart';
import 'package:quiz_app/core/common/widgets/text_divider.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';

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
      appBar: AppBar(
        title: const Text('Login'),
        leading: const IBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter credentials',
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AuthFormField(
                        controller: emailController,
                        labelText: 'E-mail',
                        hintText: 'Your e-mail',
                        required: true,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthFormField(
                        controller: passwordController,
                        labelText: 'Password',
                        hintText: 'Your password',
                        required: true,
                        obscureText: obscurePassword,
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
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextDivider(text: 'OR'),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: context.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register now',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
