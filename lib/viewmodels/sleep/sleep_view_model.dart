import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_view_model.g.dart';

@riverpod
class SleepViewModel extends _$SleepViewModel {
  @override
  int build() {
    return 0; // default index terpilih (misalnya index ke-0)
  }

  void select(int index) {
    state = index;
  }
}
