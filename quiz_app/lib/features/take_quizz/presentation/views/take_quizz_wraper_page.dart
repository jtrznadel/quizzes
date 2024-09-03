import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../dashboard/domain/entities/test_quiz_entity.dart';

@RoutePage()
class TakeQuizzWraperPage extends StatefulWidget {
  const TakeQuizzWraperPage({super.key});

  @override
  State<TakeQuizzWraperPage> createState() => _TakeQuizzWraperPageState();
}

class _TakeQuizzWraperPageState extends State<TakeQuizzWraperPage> {
  final _stepController = PageController();
  int _currentStep = 1;

  @override
  void dispose() {
    _stepController.dispose();
    super.dispose();
  }

  List<QuizzStep> pages = [
    QuizzStep(
      question: QuestionEntity(
        question: '1. What is one of the key features of cryptocurrencies?',
        answers: ['Physical existence', 'Cannot be counterfeited and double-spent', 'They are centralized', 'They are regulated'],
      ),
    ),
    QuizzStep(
      question: QuestionEntity(
        question: '2. What is one of the key features of cryptocurrencies?',
        answers: ['Physical existence', 'Physical existence', 'Physical existence', 'Physical existence'],
      ),
    ),
    QuizzStep(
      question: QuestionEntity(
        question: '3. What is one of the key features of cryptocurrencies?',
        answers: ['Physical existence', 'Physical existence', 'Physical existence', 'Physical existence'],
      ),
    ),
    QuizzStep(
      question: QuestionEntity(
        question: '4. What is one of the key features of cryptocurrencies?',
        answers: ['Physical existence', 'Physical existence', 'Physical existence', 'Physical existence'],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: QuizzProgressIndicator(numberOfSteps: pages.length, currentStep: _currentStep),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
        child: PageView(
          controller: _stepController,
          onPageChanged: (value) => setState(() => _currentStep = value + 1),
          children: pages,
        ),
      ),
    );
  }
}

class QuizzStep extends StatelessWidget {
  const QuizzStep({super.key, required this.question});

  final QuestionEntity question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          question.question,
          style: context.textTheme.headlineMedium,
        ),
        const ExtraLargeVSpacer(),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(question.answers.length, (index) {
            return QuizzAnswerCard(
              answer: question.answers[index],
              indicator: ['A', 'B', 'C', 'D'][index],
            );
          }),
        ),
      ],
    );
  }
}

class QuizzAnswerCard extends StatelessWidget {
  const QuizzAnswerCard({super.key, required this.answer, required this.indicator});

  final String answer;
  final String indicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2,
      height: context.width / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      padding: const EdgeInsets.all(AppTheme.pageDefaultSpacingSize),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                indicator,
                style: context.textTheme.labelMedium,
              ),
            ),
            const ExtraLargeVSpacer(),
            Expanded(
              flex: 8,
              child: Text(
                answer,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizzProgressIndicator extends StatelessWidget {
  const QuizzProgressIndicator({super.key, required this.numberOfSteps, required this.currentStep});

  final int numberOfSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColorScheme.secondary,
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          height: 8,
          decoration: BoxDecoration(
            color: AppColorScheme.primary,
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          ),
          width: context.width * currentStep / numberOfSteps,
        ),
      ],
    );
  }
}

class QuestionEntity {
  final String question;
  final List<String> answers;

  QuestionEntity({required this.question, required this.answers});
}
