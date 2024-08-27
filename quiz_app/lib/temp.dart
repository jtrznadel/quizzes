import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/app_router.dart';

//TODO: Remove this screen on realease
@RoutePage()
class TempPage extends ConsumerWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  AppRouter().push(const WelcomeRoute());
                },
                child: const Text('Welcome page')),
            ElevatedButton(
              onPressed: () {
                AppRouter().push(const QuizzCreationRoute());
              },
              child: const Text('Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                AppRouter().push(const QuizzDetailsRoute());
              },
              child: const Text('Quiz details'),
            ),
            ElevatedButton(
              onPressed: () {
                AppRouter().push(const DashboardRoute());
              },
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
