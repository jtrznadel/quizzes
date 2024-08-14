import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/quizz_summary.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/media_res.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/quizz/presentation/tabs/quiz_details_questions_tab.dart';
import 'package:quiz_app/features/quizz/presentation/tabs/quiz_details_settings_tab.dart';

class QuizzDetailsScreen extends StatelessWidget {
  const QuizzDetailsScreen({super.key});

  static const String routeName = '/quizzDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: StringRes.quizzDetailsAppbarTitle,
        actions: [
          IconButton(
            icon: SvgPicture.asset(MediaRes.share),
            onPressed: () {},
          ).addPadding(padding: const EdgeInsets.only(right: 16)),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const QuizzSummary(
              title: StringRes.tempQuizzSummaryTitle,
              description: StringRes.tempQuizzSummaryDescription,
            ).addPadding(padding: const EdgeInsets.only(bottom: 16)),
            TabBar(
              dividerColor: AppColorScheme.border,
              labelColor: AppColorScheme.primary,
              labelStyle: context.textTheme.labelMedium!,
              unselectedLabelColor: AppColorScheme.textSecondary,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              splashBorderRadius: BorderRadius.circular(16),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 2,
              indicatorWeight: 2,
              tabs: const [
                Tab(text: StringRes.quizzDetailsTabQuestions),
                Tab(text: StringRes.quizzDetailsTabSettings),
                Tab(text: StringRes.quizzDetailsTabStatistics),
                Tab(text: StringRes.quizzDetailsTabGeneral),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  QuizDetailsQuestionsTab(),
                  QuizDetailsSettingsTab(),
                  Center(
                    child: Text(StringRes.quizzDetailsTabStatistics),
                  ),
                  Center(
                    child: Text(StringRes.quizzDetailsTabGeneral),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).addPadding(padding: const EdgeInsets.only(left: 16, right: 16)),
    );
  }
}
