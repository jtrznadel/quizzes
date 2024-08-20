import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/features/auth/presentation/refactors/selection_screen_body.dart';

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
          const SelectionScreenBody(),
        ],
      ),
    );
  }
}
