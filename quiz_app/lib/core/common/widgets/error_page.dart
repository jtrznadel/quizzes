import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../services/app_router.dart';
import 'secondary_button.dart';
import 'spacers/vertical_spacers.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error, style: Theme.of(context).textTheme.labelLarge),
            const MediumVSpacer(),
            SecondaryButton(
                onPressed: () {
                  context.router.push(const DashboardRoute());
                },
                text: S.of(context).goBackToDashboard)
          ],
        ),
      ),
    );
  }
}
