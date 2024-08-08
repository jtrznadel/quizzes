import 'package:flutter/material.dart';
import 'package:quiz_app/features/auth/presentation/views/forgot_pasword_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/new_password_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/successful_password_reset_request_screen.dart';

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
            const Text('Temp Screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
                child: const Text('Login page')),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ForgotPasswordScreen.routeName);
              },
              child: const Text('Forgot password page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(SuccessfulPasswordResetRequestScreen.routeName);
              },
              child: const Text('Reset password page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NewPasswordScreen.routeName);
              },
              child: const Text('New password screen'),
            ),
          ],
        ),
      ),
    );
  }
}
