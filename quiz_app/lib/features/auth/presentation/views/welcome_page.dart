import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/res/media_res.dart';
import '../widgets/selection_page_body.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
          const SelectionPageBody(),
        ],
      ),
    );
  }
}
