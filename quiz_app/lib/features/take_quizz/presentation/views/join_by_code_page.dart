import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/form_field.dart';
import '../../../../core/common/widgets/secondary_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../quizz_details/application/join_by_code_controller.dart';

@RoutePage()
class JoinByCodePage extends ConsumerWidget {
  const JoinByCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(joinByCodeControllerProvider);
    final textController = ref.read(joinByCodeControllerProvider.notifier);
    return Scaffold(
      appBar: const BasicAppBar(title: 'Join Quizz'),
      body: Padding(
        padding: const EdgeInsets.all(
          AppTheme.pageDefaultSpacingSize,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).joinByCodeHeading,
              style: context.textTheme.headlineLarge,
            ),
            const SmallVSpacer(),
            Text(
              S.of(context).joinByCodeSubheading,
              style: context.textTheme.bodyMedium,
            ),
            const ExtraLargeVSpacer(),
            IFormField(
              labelText: S.of(context).joinByCodeFormFieldLabel,
              hintText: S.of(context).joinByCodeFormFieldHint,
              controller: TextEditingController(text: code)
                ..addListener(() {
                  textController.updateCode(code);
                }),
            ),
            const ExtraLargeVSpacer(),
            SizedBox(
              width: double.infinity,
              child: code.length != 8
                  ? SecondaryButton(
                      onPressed: () {},
                      text: S.of(context).joinByCodeAccessButton,
                      bgColor: AppColorScheme.disabled,
                      contentColor: AppColorScheme.textSecondary,
                    )
                  : BasicButton(
                      onPressed: () {},
                      text: S.of(context).joinByCodeAccessButton,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
