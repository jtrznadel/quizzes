import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/form_field.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class QuizzSuccessScreen extends StatelessWidget {
  const QuizzSuccessScreen({super.key});
  //TODO: Replace with actual link
  final String mockLink = 'link.com/custom-code';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringRes.quizzCreationSuccessHeading,
            style: context.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            StringRes.quizzCreationSuccessSubheading,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mockLink,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: mockLink));
                  },
                  icon: SvgPicture.asset(
                    MediaRes.copy,
                    colorFilter: const ColorFilter.mode(
                      AppColorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          BasicButton(
            onPressed: () {},
            text: StringRes.quizzCreationSuccessShareButton,
            width: double.infinity,
          ),
          const SizedBox(
            height: 16,
          ),
          SecondaryButton(
            onPressed: () {},
            text: StringRes.quizzCreationSuccessBackButton,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
