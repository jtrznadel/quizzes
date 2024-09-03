import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../../core/common/widgets/error_page.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/add_padding_extension.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../application/dashboard_controller.dart';
import '../../domain/entities/test_quiz_entity.dart';
import '../../domain/quiz_dashboard_model.dart';
import '../widgets/new_quiz_button.dart';
import '../widgets/quiz_list_item.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
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
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (quizListModel) {
            return Column(
              children: [
                topBar(context, ref),
                const SmallVSpacer(),
                Expanded(
                  child: PaginatedList<QuizDashboardModel>(
                    loadingIndicator: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppTheme.pageDefaultSpacingSize),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    items: quizListModel.items,
                    isRecentSearch: false,
                    isLastPage: quizListModel.totalItemsCount <=
                        quizListModel.items.length,
                    onLoadMore: (index) {
                      controller.loadMore();
                    },
                    builder: (quiz, index) {
                      return Column(
                        children: [
                          QuizListItem(quizEntity: quiz).addPadding(
                            padding: const EdgeInsets.only(
                              bottom: AppTheme.dashboardQuizItemBottomPadding,
                            ),
                          ),
                          if(index == quizListModel.items.length - 1)
                            const NewQuizButton(),
                        ],
                      );
                    },
                  ),
                ),
                //const NewQuizButton(),
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

  Widget topBar(BuildContext context, WidgetRef ref) {
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
                context.router.push(const ProfileRoute());
              },
              icon:
                  SvgPicture.asset(MediaRes.userProfile, width: 24, height: 24),
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
