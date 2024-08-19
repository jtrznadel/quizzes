import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';
import 'package:quiz_app/features/auth/presentation/views/forgot_pasword_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/new_password_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:quiz_app/features/auth/presentation/views/successful_password_reset_request_screen.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_creation_screen.dart';
import 'package:quiz_app/features/quizz/presentation/views/quizz_details_screen.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/add_new_question_bottom_sheet.dart';
import 'package:quiz_app/features/quizz/presentation/widgets/quiz_attempt_item.dart';

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
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/welcome');
                },
                child: const Text('Welcome page')),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(SignInScreen.routeName);
            //     },
            //     child: const Text('Login page')),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
            //   },
            //   child: const Text('Forgot password page'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed(SuccessfulPasswordResetRequestScreen.routeName);
            //   },
            //   child: const Text('Reset password page'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed(NewPasswordScreen.routeName);
            //   },
            //   child: const Text('New password screen'),
            // ),
            ElevatedButton(
              onPressed: () {
                context.navigator.pushNamed(QuizzCreationScreen.routeName);
              },
              child: const Text('Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                AddNewQuestionBottomSheet.show(context);
              },
              child: const Text('Show bottom sheet'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigator.pushNamed(QuizzDetailsScreen.routeName);
              },
              child: const Text('Quiz details'),
            ),
            const QuizAttemptItem().addPadding(padding: const EdgeInsets.all(16)),
          ],
        ),
      ),
    );
  }
}
