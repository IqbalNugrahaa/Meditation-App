import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/helpers/session_manager.dart';

part 'welcome_sleep_view_model.g.dart';

@riverpod
class WelcomeSleepViewModel extends _$WelcomeSleepViewModel {
  @override
  void build() {}

  Future<void> saveSleepSession() async {
    await SessionManager.saveSleep(true);
  }
}
