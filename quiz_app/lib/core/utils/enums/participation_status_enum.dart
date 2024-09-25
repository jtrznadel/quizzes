import 'dart:ui';

import '../../theme/app_color_scheme.dart';

enum ParticipationStatus {
  started(
    AppColorScheme.warningLight,
    AppColorScheme.warning,
  ),
  stopped(
    AppColorScheme.errorLight,
    AppColorScheme.error,
  ),
  finished(
    AppColorScheme.successLight,
    AppColorScheme.success,
  );

  const ParticipationStatus(this.backgroundColor, this.textColor);
  final Color backgroundColor;
  final Color textColor;

  static ParticipationStatus getParticipationStatus(String status) {
    switch (status) {
      case 'Started':
        return ParticipationStatus.started;
      case 'Stopped':
        return ParticipationStatus.stopped;
      case 'Finished':
        return ParticipationStatus.finished;
      default:
        return ParticipationStatus.stopped;
    }
  }
}
