import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';

class NewQuizButton extends StatelessWidget {
  const NewQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _container(
      context,
      _content(context),
    );
  }

  Widget _container(BuildContext context, Widget content) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.dashboardAddNewButtonBorderRadius),
        color: AppColorScheme.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            AppRouter().push(const QuizzCreationRoute());
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.dashboardAddNewButtonBorderRadius),
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: AppColorScheme.border,
            strokeWidth: AppTheme.dottedBorderWidth,
            radius: const Radius.circular(AppTheme.dashboardAddNewButtonBorderRadius),
            borderPadding: const EdgeInsets.all(0.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.dashboardAddNewButtonBorderRadius),
              child: content,
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return SizedBox(
      height: AppTheme.dashboardAddNewButtonHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MediaRes.addQuiz,
              width: AppTheme.dashboardNewQuizIconSize,
              height: AppTheme.dashboardNewQuizIconSize,
            ),
            const SmallVSpacer(),
            Text(
              'Add new quiz',
              style: context.theme.textTheme.headlineMedium!.copyWith(
                color: AppColorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
