import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/media_res.dart';
import '../../theme/app_color_scheme.dart';

enum AnswerResult { correct, wrong, neutral }

AnswerResult getAnswerState(String answerId, String correctAnswerId, String userAnswerId) {
  if (answerId == correctAnswerId) {
    return AnswerResult.correct;
  } else if (answerId == userAnswerId) {
    return AnswerResult.wrong;
  } else {
    return AnswerResult.neutral;
  }
}

extension AnswerResultEx on AnswerResult {
  Color getAnswerTextColor() {
    switch (this) {
      case AnswerResult.correct:
        return AppColorScheme.success;
      case AnswerResult.wrong:
        return AppColorScheme.error;
      case AnswerResult.neutral:
        return AppColorScheme.textPrimary;
      default:
        return AppColorScheme.textPrimary;
    }
  }

  Color getAnswerBackgroundColor() {
    switch (this) {
      case AnswerResult.correct:
        return AppColorScheme.successLight;
      case AnswerResult.wrong:
        return AppColorScheme.errorLight;
      case AnswerResult.neutral:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  Widget? getAnswerIcon() {
    switch (this) {
      case AnswerResult.correct:
        return SvgPicture.asset(MediaRes.correctAnswer);
      case AnswerResult.wrong:
        return SvgPicture.asset(MediaRes.wrongAnswer);
      case AnswerResult.neutral:
        return null;
      default:
        return null;
    }
  }
}
