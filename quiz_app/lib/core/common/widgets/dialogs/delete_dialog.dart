import 'package:flutter/material.dart';
import 'package:quiz_app/core/common/widgets/dialogs/basic_dialog.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.onCancel,
  });

  final String title;
  final Widget content;
  final void Function() onConfirm;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: title,
      content: content,
      actions: [
          ElevatedButton(
            onPressed: () {
              onCancel ?? context.navigator.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              //TODO: extract to strings
              "Cancel",
              style: context.theme.textTheme.labelMedium!
                  .copyWith(color: AppColorScheme.primary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.error,
            ),
            child: Text(
              //TODO: extract to strings
              "Delete",
              style: context.theme.textTheme.labelMedium!
                  .copyWith(color: AppColorScheme.textContrast),
            ),
          )
      ]
    );
  }
}
