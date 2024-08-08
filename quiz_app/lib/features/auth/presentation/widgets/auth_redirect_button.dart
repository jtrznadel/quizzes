import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

class AuthRedirectButton extends StatelessWidget {
  const AuthRedirectButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.navigateTo,
  });

  final String text;
  final String buttonText;
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.textTheme.bodyMedium,
          ),
          TextButton(
            onPressed: () {
              context.navigator.pushReplacementNamed(navigateTo);
            },
            child: Text(
              buttonText,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
