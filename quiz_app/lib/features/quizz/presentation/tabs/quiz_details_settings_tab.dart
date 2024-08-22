import 'package:flutter/material.dart';
import '../../../../core/common/widgets/basic_button.dart';
import '../../../../core/common/widgets/spacers/vertical_spacers.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../widgets/switch_button.dart';
import '../widgets/text_checkbox.dart';
import '../../../../generated/l10n.dart';

class QuizDetailsSettingsTab extends StatefulWidget {
  const QuizDetailsSettingsTab({super.key});

  @override
  State<QuizDetailsSettingsTab> createState() => _QuizDetailsSettingsTabState();
}

class _QuizDetailsSettingsTabState extends State<QuizDetailsSettingsTab> {
  bool quizStatusValue = false;
  bool quizAvailabilityActiveValue = false;
  bool quizAvailabilityPublicValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SmallVSpacer(),
        Text(
          S.of(context).quizzDetailsTabSettingsSubheading,
          style: context.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
        ),
        const SmallVSpacer(),
        Text(
          S.of(context).quizzDetailsTabSettingsQuizStatus,
          style: context.textTheme.labelLarge,
        ),
        const SmallVSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                S.of(context).quizzDetailsTabSettingsQuizStatusDescription,
                style: context.textTheme.bodyMedium,
              ),
            ),
            SwitchButton(
              value: quizStatusValue,
              onChanged: (value) {
                setState(() {
                  quizStatusValue = value;
                });
              },
            ),
          ],
        ),
        const LargeVSpacer(),
        Text(
          S.of(context).quizzDetailsTabSettingsQuizAvailability,
          style: context.textTheme.labelLarge,
        ),
        const SmallVSpacer(),
        Text(
          S.of(context).quizzDetailsTabSettingsQuizAvailabilityDescription,
          style: context.textTheme.bodyMedium,
        ),
        const MediumVSpacer(),
        TextCheckbox(
          text: S.of(context).quizzDetailsTabSettingsQuizAvailabilityActive,
          value: quizAvailabilityActiveValue,
          onChanged: (value) {
            setState(() {
              quizAvailabilityActiveValue = value!;
            });
          },
        ),
        const SmallVSpacer(),
        TextCheckbox(
          text: S.of(context).quizzDetailsTabSettingsQuizAvailabilityPublic,
          value: quizAvailabilityPublicValue,
          onChanged: (value) {
            setState(() {
              quizAvailabilityPublicValue = value!;
            });
          },
        ),
        const ExtraLargeVSpacer(),
        Align(
          alignment: Alignment.centerRight,
          child: BasicButton(
            text: S.of(context).quizzDetailsTabSettingsSaveChanges,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
