import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'core/extensions/context_extension.dart';
import 'core/services/app_router.dart';
import 'features/dashboard/presentation/views/dashboard_screen.dart';
import 'features/quizz/presentation/views/quizz_creation_screen.dart';
import 'features/quizz/presentation/views/quizz_details_screen.dart';

//TODO: Remove this screen on realease
@RoutePage()
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
                  context.router.push(const WelcomeRoute());
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
            ElevatedButton(
              onPressed: () {
                context.navigator.pushNamed(DashboardScreen.routeName);
              },
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
