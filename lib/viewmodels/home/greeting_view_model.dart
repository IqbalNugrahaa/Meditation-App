import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'greeting_view_model.g.dart';

@riverpod
class GreetingViewModel extends _$GreetingViewModel {
  @override
  String build() => _getGreeting();

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  // Opsional: jika kamu ingin refresh manual
  void updateGreeting() {
    state = _getGreeting();
  }
}
