import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_theme.dart';
import '../../application/quizz_take_controller.dart';
import '../widgets/quizz_multiple_answer_card.dart';
import '../widgets/quizz_progress_indicator.dart';
import '../widgets/quizz_step_content.dart';

@RoutePage()
class TakeQuizzWraperPage extends ConsumerStatefulWidget {
  const TakeQuizzWraperPage({super.key});

  @override
  ConsumerState<TakeQuizzWraperPage> createState() => _TakeQuizzWraperPageState();
}

class _TakeQuizzWraperPageState extends ConsumerState<TakeQuizzWraperPage> {
  final stepController = PageController();

  List<QuizzStepContent> pages = [
    QuizzStepContent(
      question: QuestionEntity(
        question: '1. What is one of the key features of cryptocurrencies?',
        answers: ['Physical existence', 'Cannot be counterfeited and double-spent', 'They are centralized', 'They are regulated'],
        questionId: '1',
      ),
    ),
    QuizzStepContent(
      question: QuestionEntity(
        question: '2. What is the underlying technology behind cryptocurrencies?',
        answers: ['Blockchain', 'Cloud Computing', 'Quantum Computing', 'Artificial Intelligence'],
        questionId: '2',
      ),
    ),
    QuizzStepContent(
      question: QuestionEntity(
        question: '3. Which of the following is a popular cryptocurrency?',
        answers: ['Bitcoin', 'Dollar', 'Euro', 'Yen'],
        questionId: '3',
      ),
    ),
    QuizzStepContent(
      question: QuestionEntity(
        question: '4. What is the process of verifying transactions in a blockchain called?',
        answers: ['Mining', 'Harvesting', 'Plowing', 'Sowing'],
        questionId: '4',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final quizzState = ref.watch(quizzTakeControllerProvider);
    final quizzController = ref.read(quizzTakeControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: quizzState.maybeWhen(
          loaded: (currentStep, answers) => QuizzProgressIndicator(
            currentStep: currentStep,
            numberOfSteps: pages.length,
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: stepController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: pages,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  quizzState.maybeWhen(
                    loaded: (currentStep, answers) => currentStep > 1
                        ? BasicButton(
                            onPressed: () {
                              if (currentStep > 0) {
                                stepController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                quizzController.previousStep();
                              }
                            },
                            text: 'Previous')
                        : const Spacer(),
                    orElse: () => const Spacer(),
                  ),
                  quizzState.maybeWhen(
                    loaded: (currentStep, answers) => currentStep < pages.length
                        ? BasicButton(
                            onPressed: () {
                              if (currentStep < pages.length) {
                                stepController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                quizzController.nextStep();
                              }
                            },
                            text: 'Next',
                          )
                        : BasicButton(
                            onPressed: () {
                              quizzController.finishQuizz(id: '1');
                              context.router.maybePop();
                            },
                            text: 'Finish',
                          ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
