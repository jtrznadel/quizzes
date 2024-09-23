import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'join_by_code_controller.g.dart';

@riverpod
class JoinByCodeController extends _$JoinByCodeController {
  @override
  String build() {
    return '';
  }

  void updateCode(String code) {
    state = code;
  }
}
