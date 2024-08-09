import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/quiz_status_badge.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';
import 'package:quiz_app/features/dashboard/domain/entities/test_quiz_entity.dart';
import 'package:quiz_app/features/dashboard/presentation/widgets/quiz_list_item.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizEntity = TestQuizEntity(
      quizTitle:
          'Identify your bigest roadblock to succeeding in cryptocurrency',
      quizDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus sagittis augue, vitae facilisis sem volutpat nec. Phasellus ac tincidunt nisl. Donec sed rutrum neque, vitae mattis velit. Donec non neque a erat finibus rutrum. Proin tincidunt leo hendrerit, sagittis lacus quis, finibus massa.',
      quizStatus: 'Active',
      quizNumberOfQuestions: 5,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/welcome');
              },
              child: const Text('Welcome page'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuizStatusBadge(
                  text: 'Active',
                  backgroundColor: AppColorScheme.successLight,
                  textColor: AppColorScheme.success,
                )
              ],
            ),
            QuizListItem(quizEntity: quizEntity)
          ],
        ),
      ),
    );
  }
}
