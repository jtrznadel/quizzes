import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'basic_dialog.dart';
import '../../../extensions/context_extension.dart';
import '../../../theme/app_color_scheme.dart';
import '../../../../generated/l10n.dart';

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
    return BasicDialog(title: title, content: content, actions: [
      ElevatedButton(
        onPressed: () {
          onCancel ?? context.router.maybePop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          S.of(context).cancelButton,
          style: context.theme.textTheme.labelMedium!.copyWith(color: AppColorScheme.primary),
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
          S.of(context).deleteButton,
          style: context.theme.textTheme.labelMedium!.copyWith(color: AppColorScheme.textContrast),
        ),
      )
    ]);
  }
}
