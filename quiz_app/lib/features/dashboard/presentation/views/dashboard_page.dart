import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/test_quiz_entity.dart';
import '../widgets/new_quiz_button.dart';
import '../widgets/quiz_list_item.dart';
import '../../../../generated/l10n.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = generateMockQuizes(10);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topBar(context),
            const SmallVSpacer(),
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      return QuizListItem(quizEntity: quizzes[index]).addPadding(
                        padding: const EdgeInsets.only(
                          bottom: AppTheme.dashboardQuizItemBottomPadding,
                        ),
                      );
                    },
                  ),
                  const NewQuizButton(),
                ],
              ),
            )
          ],
        ),
      ).addPadding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).dashboardTopHeading,
              style: context.theme.textTheme.headlineLarge,
            ),
            IconButton(
              onPressed: () {
                AppRouter().push(const ProfileRoute());
              },
              icon: SvgPicture.asset(MediaRes.userProfile, width: 24, height: 24),
            )
          ],
        ),
        const SmallVSpacer(),
        Text(
          S.of(context).dashboardSubheading,
          style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
        )
      ],
    );
  }

  List<TestQuizEntity> generateMockQuizes(int number) {
    List<TestQuizEntity> quizes = [];
    for (int i = 0; i < number; i++) {
      quizes.add(
        TestQuizEntity(
          quizTitle: 'Identify your bigest roadblock to succeeding in cryptocurrency',
          quizDescription:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus sagittis augue, vitae facilisis sem volutpat nec. Phasellus ac tincidunt nisl. Donec sed rutrum neque, vitae mattis velit. Donec non neque a erat finibus rutrum. Proin tincidunt leo hendrerit, sagittis lacus quis, finibus massa.',
          quizStatus: 'Active',
          quizNumberOfQuestions: Random().nextInt(50),
        ),
      );
    }
    return quizes;
  }
}
