import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/error_page.dart';
import '../../../../core/common/widgets/quizz_summary.dart';
import '../../../../core/common/widgets/spacers/horizontal_spacers.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../application/quiz_details_controller.dart';
import '../tabs/quiz_details_general_tab.dart';
import '../tabs/quiz_details_questions_tab.dart';
import '../tabs/quiz_details_settings_tab.dart';
import '../tabs/quiz_details_statistics_tab.dart';
import '../../../../generated/l10n.dart';
import '../../../quiz_generation/widgets/share_quizz_bottom_sheet.dart';

@RoutePage()
class QuizzDetailsPage extends ConsumerStatefulWidget {
  const QuizzDetailsPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState createState() {
    return _QuizzDetailsPageState();
  }
}

class _QuizzDetailsPageState extends ConsumerState<QuizzDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .watch(quizDetailsControllerProvider.notifier)
            .getQuizDetails(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.surface,
      appBar: BasicAppBar(
        title: S.of(context).quizzDetailsAppbarTitle,
        actions: [
          IconButton(
            icon: SvgPicture.asset(MediaRes.share),
            onPressed: () {
              ShareQuizzBottomSheet.show(context);
            },
          ),
          const SmallHSpacer(),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(quizDetailsControllerProvider);
          return state.when(
            loading: () {
              return const Padding(
                padding: EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            loaded: (quizDetails) {
          return Padding(
            padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
            child: Column(
              children: [
                QuizzSummary(
                  title: quizDetails.title,
                  description: quizDetails.description,
                ),
                const MediumVSpacer(),
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
            ),
          );
            },
            error: (error) {
              return ErrorPage(error: error);
            },
          );
        }),
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
