import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../../core/common/widgets/error_page.dart';
import '../../../../core/common/widgets/loading_indicator.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../application/dashboard_controller.dart';
import '../../domain/quiz_dashboard_model.dart';
import '../../domain/quiz_list_model.dart';
import '../widgets/new_quiz_button.dart';
import '../widgets/quiz_list_item.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardControllerProvider.notifier).initLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardControllerProvider);
    final controller = ref.read(dashboardControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          loading: () => const LoadingIndicator(),
          loaded: (quizListModel, currentPage) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.pageDefaultSpacingSize),
              child: Column(
                children: [
                  topBar(context),
                  const SmallVSpacer(),
                  quizListModel.items.isEmpty
                      ? Column(
                          children: [
                            const NewQuizButton(),
                            const LargeVSpacer(),
                            Text(
                              S.of(context).dashboardQuizzesEmpty,
                              style: context.theme.textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Expanded(
                          child: quizList(quizListModel, controller),
                        ),
                ],
              ),
            );
          },
          error: (message) => Center(
            child: ErrorPage(error: message),
          ),
        ),
      ),
    );
  }

  Widget quizList(QuizListModel quizListModel, DashboardController controller) {
    return Theme(
      data: AppTheme.theme.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: PaginatedList<QuizDashboardModel>(
        loadingIndicator: const LoadingIndicator(),
        items: quizListModel.items,
        isRecentSearch: false,
        isLastPage: quizListModel.totalItemsCount <= quizListModel.items.length,
        onLoadMore: (index) {
          controller.loadMore();
        },
        builder: (quiz, index) {
          if (index == 0) {
            return Column(
              children: [
                const NewQuizButton(),
                const MediumVSpacer(),
                QuizListItem(quizEntity: quiz),
                const MediumVSpacer(),
              ],
            );
          } else {
            return Column(
              children: [
                QuizListItem(quizEntity: quiz),
                const MediumVSpacer(),
              ],
            );
          }
        },
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
                ref.read(appRouterProvider).push(const ProfileRoute());
              },
              icon: SvgPicture.asset(
                MediaRes.userProfile,
                width: AppTheme.dashboardUserProfileIconSize,
                height: AppTheme.dashboardUserProfileIconSize,
              ),
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
}
