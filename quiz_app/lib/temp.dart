import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'core/extensions/context_extension.dart';
import 'features/dashboard/presentation/views/dashboard_page.dart';
import 'features/quizz/presentation/views/quizz_creation_page.dart';
import 'features/quizz/presentation/views/quizz_details_page.dart';

import 'core/services/app_router.dart';

//TODO: Remove this screen on realease
@RoutePage()
class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.router.push(const WelcomeRoute());
                },
                child: const Text('Welcome page')),
            ElevatedButton(
              onPressed: () {
                context.router.push(const QuizzCreationRoute());
              },
              child: const Text('Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.push(const QuizzDetailsRoute());
              },
              child: const Text('Quiz details'),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.push(const DashboardRoute());
              },
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
