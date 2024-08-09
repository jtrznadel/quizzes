import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/dashboard/domain/entities/test_quiz_entity.dart';
import 'package:quiz_app/features/dashboard/presentation/widgets/new_quiz_button.dart';
import 'package:quiz_app/features/dashboard/presentation/widgets/quiz_list_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final quizzes = generateMockQuizes(10);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topBar(context),
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      return QuizListItem(quizEntity: quizzes[index])
                          .addPadding(
                              padding: const EdgeInsets.only(bottom: 24));
                    },
                  ),
                  const NewQuizButton(),
                ],
              ),
            )
          ],
        ),
      ).addPadding(
        padding: const EdgeInsets.all(16),
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
              StringRes.dashboardTopHeading,
              style: context.theme.textTheme.headlineLarge,
            ),
            IconButton(
              onPressed: () {
                //TODO: open user profile
              },
              icon:
                  SvgPicture.asset(MediaRes.userProfile, width: 24, height: 24),
            )
          ],
        ).addPadding(
          padding: const EdgeInsets.only(bottom: 8),
        ),
        Text(
          StringRes.dashboardSubheading,
          style: context.theme.textTheme.bodyMedium!
              .copyWith(color: AppColorScheme.textSecondary),
        )
      ],
    ).addPadding(padding: const EdgeInsets.only(bottom: 8));
  }

  List<TestQuizEntity> generateMockQuizes(int number) {
    List<TestQuizEntity> quizes = [];
    for (int i = 0; i < number; i++) {
      quizes.add(
        TestQuizEntity(
          quizTitle:
              'Identify your bigest roadblock to succeeding in cryptocurrency',
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
