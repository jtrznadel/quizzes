import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/quizz_summary.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../tabs/quiz_details_general_tab.dart';
import '../tabs/quiz_details_questions_tab.dart';
import '../tabs/quiz_details_settings_tab.dart';
import '../tabs/quiz_details_statistics_tab.dart';
import '../../../../generated/l10n.dart';

class QuizzDetailsPage extends StatefulWidget {
  const QuizzDetailsPage({super.key});

  static const String routeName = '/quizzDetails';

  @override
  State<StatefulWidget> createState() {
    return _QuizzDetailsPageState();
  }
}

class _QuizzDetailsPageState extends State<QuizzDetailsPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: S.of(context).quizzDetailsAppbarTitle,
        actions: [
          IconButton(
            icon: SvgPicture.asset(MediaRes.share),
            onPressed: () {},
          ).addPadding(padding: const EdgeInsets.only(right: 16)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizzSummary(
              title: S.of(context).tempQuizzSummaryTitle,
              description: S.of(context).tempQuizzSummaryDescription,
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
              controller: tabController,
              onTap: (index) {
                setState(() {});
              },
              tabs: [
                Tab(text: S.of(context).quizzDetailsTabQuestions),
                Tab(text: S.of(context).quizzDetailsTabSettings),
                Tab(text: S.of(context).quizzDetailsTabStatistics),
                Tab(text: S.of(context).quizzDetailsTabGeneral),
              ],
            ),
            _getTabAtIndex(tabController.index),
          ],
        ).addPadding(padding: const EdgeInsets.only(left: 16, right: 16)),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _getTabAtIndex(int index) {
    switch (index) {
      case 0:
        return const QuizDetailsQuestionsTab();
      case 1:
        return const QuizDetailsSettingsTab();
      case 2:
        return const QuizDetailsStatisticsTab();
      case 3:
        return const QuizDetailsGeneralTab();
      default:
        return Center(
          child: Text(S.of(context).quizzDetailsTabGeneral),
        );
    }
  }
}
