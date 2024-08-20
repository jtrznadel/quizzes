import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_creation_screen.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_details_screen.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const Text('Welcome page')),
            ElevatedButton(
              onPressed: () {
                context.navigator.pushNamed(QuizzCreationScreen.routeName);
              },
              child: const Text('Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigator.pushNamed(QuizzDetailsScreen.routeName);
              },
              child: const Text('Quiz details'),
            ),
          ],
        ),
      ),
    );
  }
}
