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
                  ref.read(appRouterProvider).push(const WelcomeRoute());
                },
                child: const Text('Welcome page')),
            ElevatedButton(
              onPressed: () {
                ref.read(appRouterProvider).push(const QuizzCreationRoute());
              },
              child: const Text('Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(appRouterProvider).push(QuizzDetailsRoute(id: '27aef3bf-a59c-4015-a2ad-a62a87c7801b'));
              },
              child: const Text('Quiz details'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(appRouterProvider).push(const DashboardRoute());
              },
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
