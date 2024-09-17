import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../res/media_res.dart';

enum QuizzScore {
  genius,
  awesome,
  good,
  couldBeBetter,
  bad,
}

extension QuizzScoreEx on QuizzScore {
  String getMessage() {
    switch (this) {
      case QuizzScore.genius:
        return S.current.quizzTakeScoreURGenius;
      case QuizzScore.awesome:
        return S.current.quizzTakeScoreAwesome;
      case QuizzScore.good:
        return S.current.quizzTakeScoreGood;
      case QuizzScore.couldBeBetter:
        return S.current.quizzTakeScoreCouldBeBetter;
      case QuizzScore.bad:
        return S.current.quizzTakeScoreBad;
      default:
        return '';
    }
  }

  Color getColor() {
    switch (this) {
      case QuizzScore.genius:
        return Colors.green;
      case QuizzScore.awesome:
        return Colors.lightGreen;
      case QuizzScore.good:
        return Colors.yellow;
      case QuizzScore.couldBeBetter:
        return Colors.orange;
      case QuizzScore.bad:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  String getImage() {
    switch (this) {
      case QuizzScore.genius:
        return MediaRes.quizzScoreGood;
      case QuizzScore.awesome:
        return MediaRes.quizzScoreGood;
      case QuizzScore.good:
        return MediaRes.quizzScoreGood;
      case QuizzScore.couldBeBetter:
        return MediaRes.quizzScoreBad;
      case QuizzScore.bad:
        return MediaRes.quizzScoreBad;
      default:
        return MediaRes.quizzScoreBad;
    }
  }
}
