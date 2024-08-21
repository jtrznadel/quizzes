import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/basic_app_bar.dart';
import 'package:quiz_app/core/common/widgets/basic_button.dart';
import 'package:quiz_app/core/common/widgets/dialogs/delete_dialog.dart';
import 'package:quiz_app/core/common/widgets/secondary_button.dart';
import 'package:quiz_app/core/common/widgets/spacers/vertical_spacers.dart';
import 'package:quiz_app/core/common/widgets/text_area.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/res/string_res.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    //TODO: replace with actual user name
    var controller = TextEditingController.fromValue(
      const TextEditingValue(text: 'John Doe'),
    );

    return Scaffold(
      appBar: const BasicAppBar(title: StringRes.profileAppbarTitle),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringRes.profileSubheading,
              style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
              textAlign: TextAlign.start,
            ),
            const SmallVSpacer(),
            TextArea(
              hintText: StringRes.profileNameHint,
              controller: controller,
              maxLines: 3,
              labelText: StringRes.profileNameLabel,
            ),
            const SmallVSpacer(),
            Text(
              StringRes.profileNameDescription,
              style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
              textAlign: TextAlign.start,
            ),
            const SmallVSpacer(),
            BasicButton(
              onPressed: () {},
              text: StringRes.profileUpdateButton,
            ),
            const ExtraLargeVSpacer(),
            Text(
              StringRes.profileDeleteButtonLabel,
              style: context.theme.textTheme.bodyMedium!.copyWith(color: AppColorScheme.textSecondary),
            ),
            const SmallVSpacer(),
            SecondaryButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteDialog(
                    //TODO: extract to strings
                    title: "Deleting account",
                    content: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        //TODO: extract to strings
                        "You are about to delete your account. This action cannot be undone.",
                        style: context.theme.textTheme.bodyMedium,
                      ),
                    ),
                    onConfirm: () {},
                  ),
                );
              },
              text: StringRes.profileDeleteButton,
              bgColor: AppColorScheme.error,
              contentColor: AppColorScheme.textContrast,
              width: null,
            ),
          ],
        ).addPadding(padding: const EdgeInsets.all(16)),
      ),
    );
  }
}
