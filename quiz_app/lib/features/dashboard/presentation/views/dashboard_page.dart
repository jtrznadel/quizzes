import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/errors/basic_error_page.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.pageDefaultSpacingSize),
          child: Column(
            children: [
              const DashboardTopBar(),
              state.when(
                  loading: () => const LoadingIndicator(),
                  loaded: (quizListModel, currentPage) {
                    return Column(
                      children: [
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
                            : const Expanded(
                                child: QuizList(),
                              ),
                      ],
                    );
                  },
                  error: (message) => Center(
                        child: BasicErrorPage(
                          errorText: S.of(context).somethingWentWrong,
                          onRefresh: () => controller.initLoad(),
                          refreshButtonText: S.of(context).refreshButton,
                          imageAsset: MediaRes.basicError,
                        ),
                      ),
                  guest: () {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              MediaRes.basicError,
                              width: 128,
                              height: 128,
                            ),
                            const LargeVSpacer(),
                            Text(
                              'You are logged in as as a guest user. Register to access all the app features.',
                              style: context.theme.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const LargeVSpacer(),
                            BasicButton(onPressed: (){
                              ref.read(appRouterProvider).push(const SignUpRoute());
                            }, text: 'Register')
                          ],),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardTopBar extends ConsumerWidget {
  const DashboardTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                //TODO: Replace with real data
                context.router.push(TakeQuizzRoute(joinCode: "6ec295ee"));
              },
              icon: SvgPicture.asset(MediaRes.generate, width: 24, height: 24),
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

class QuizList extends ConsumerWidget {
  const QuizList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);
    final controller = ref.read(dashboardControllerProvider.notifier);
    return state.maybeWhen(
      loaded: (quizListModel, currentPage) {
        return Theme(
          data: AppTheme.theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: PaginatedList<QuizDashboardModel>(
            loadingIndicator: const LoadingIndicator(),
            items: quizListModel.items,
            isRecentSearch: false,
            isLastPage:
                quizListModel.totalItemsCount <= quizListModel.items.length,
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
      },
      orElse: () {
        return const LoadingIndicator();
      },
    );
  }
}
