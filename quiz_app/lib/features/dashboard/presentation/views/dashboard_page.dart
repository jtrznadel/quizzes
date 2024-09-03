import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
import '../widgets/new_quiz_button.dart';
import '../widgets/quiz_list_item.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();

}

class _DashboardPageState extends ConsumerState<DashboardPage>{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardControllerProvider.notifier).loadQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizzes = generateMockQuizes(2);
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
                  child: ListView(
                    children: [
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: quizListModel.items.length,
                        itemBuilder: (context, index) {
                          return QuizListItem(quizEntity: quizListModel.items[index])
                              .addPadding(
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
