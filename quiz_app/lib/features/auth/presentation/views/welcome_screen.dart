import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/features/auth/presentation/views/sing_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFF0D121F),
          ),
          SvgPicture.asset(
            MediaRes.welcomeBackground,
            width: double.infinity,
            height: double.infinity,
          ),
          SvgPicture.asset(
            MediaRes.eclipse,
            alignment: Alignment.topLeft,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  MediaRes.logoSvg,
                ),
                const SizedBox(
                  height: 80,
                ),
                BasicButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/sign-in');
                  },
                  text: 'Log In',
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 16,
                ),
                SecondaryButton(
                  onPressed: () {
                    context.navigator.pushNamed(SignUpScreen.routeName);
                  },
                  text: 'Register',
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
