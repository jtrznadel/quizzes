import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../views/sign_in_page.dart';
import '../views/sing_up_page.dart';
import '../../../../generated/l10n.dart';

class SelectionPageBody extends ConsumerWidget {
  const SelectionPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
          const CustomVSpacer(80),
          BasicButton(
            onPressed: () {
             AppRouter().push(const SignInRoute());
            },
            text: S.of(context).loginButton,
            width: double.infinity,
          ),
          const MediumVSpacer(),
          SecondaryButton(
            onPressed: () {
              AppRouter().push(const SignUpRoute());
            },
            text: S.of(context).registerButton,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
