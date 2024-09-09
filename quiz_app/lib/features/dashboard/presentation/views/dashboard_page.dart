import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../../core/common/widgets/error_page.dart';
import '../../../../core/common/widgets/errors/error_snackbar.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appRouterProvider).push(
                BasicErrorRoute(
                  onRefresh: () {},
                  refreshButtonText: 'Refresh',
                  imageAsset: MediaRes.networkError,
                  errorText: 'Unable to connect to the internet. Please check your network settings and try again.',
                ),
              );
          ErrorSnackbar.show(context, 'This is an error message');
        },
        child: SvgPicture.asset(MediaRes.addQuiz, width: 24, height: 24),
      ),
      body: SafeArea(
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (quizListModel) {
            return Column(
              children: [
                topBar(context),
                const SmallVSpacer(),
                Expanded(
                  child: quizList(quizListModel, controller),
                ),
              ],
            );
          },
          error: (message) => Center(
            child: ErrorPage(error: message),
          ),
        ),
      ).addPadding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      ),
    );
  }

  Widget quizList(QuizListModel quizListModel, DashboardController controller) {
    return PaginatedList<QuizDashboardModel>(
      loadingIndicator: const Padding(
        padding:
            EdgeInsets.symmetric(vertical: AppTheme.pageDefaultSpacingSize),
        child: Center(child: CircularProgressIndicator()),
      ),
      items: quizListModel.items,
      isRecentSearch: false,
      isLastPage: quizListModel.totalItemsCount <= quizListModel.items.length,
      onLoadMore: (index) {
        controller.loadMore();
      },
      builder: (quiz, index) {
        return Column(
          children: [
            QuizListItem(quizEntity: quiz),
            const MediumVSpacer(),
            if (index == quizListModel.items.length - 1) const NewQuizButton(),
          ],
        );
      },
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
          style: context.theme.textTheme.bodyMedium!
              .copyWith(color: AppColorScheme.textSecondary),
        )
      ],
    );
  }
}
