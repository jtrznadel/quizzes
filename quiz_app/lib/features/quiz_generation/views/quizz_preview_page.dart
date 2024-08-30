import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/question_box.dart';
import '../../../../core/common/widgets/quizz_summary.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/services/app_router.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../core/common/widgets/new_question/add_new_question_bottom_sheet.dart';
import '../application/quiz_generation_controller.dart';

class QuizzPreviewPage extends ConsumerWidget {
  const QuizzPreviewPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizGenerationControllerProvider);
    final controller = ref.read(quizGenerationControllerProvider.notifier);
    return state.when(
      generating: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      generated: (quiz) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize)
                      .copyWith(top: 0), //TODO: Remove top padding if needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).quizzCreationPreviewHeading,
                        style: context.textTheme.headlineLarge,
                      ),
                      const LargeVSpacer(),
                      QuizzSummary(
                        title: controller.title,
                        description: controller.description,
                      ),
                      const ExtraLargeVSpacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SecondaryButton(
                          onPressed: () {
                            AddNewQuestionBottomSheet.show(context);
                          },
                          text: S.of(context).quizzCreationAddQuestionButton,
                        ),
                      ),
                      const LargeVSpacer(),
                      //TODO: Remove loop and implement a listview.builder with question model
                      SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: controller.questions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                QuestionBox(
                                  questionIndex: index,
                                  question: controller.questions[index],
                                ),
                                const CustomVSpacer(32),
                              ],
                            );
                          },
                        ),
                      ),
                      const LargeVSpacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: Container(
                  color: AppColorScheme.surface,
                  padding: const EdgeInsets.only(top: 8),
                  child: BasicButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    text: S.of(context).saveQuizzButton,
                  ),
                ),
              )
            ],
          ),
        );
      },
      error: (error) {
        return Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error),
                const MediumVSpacer(),
                SecondaryButton(
                  onPressed: () {
                    context.router.push(const DashboardRoute());
                  },
                  //TODO: replace with translation
                  text: 'Go back to dashboard',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}