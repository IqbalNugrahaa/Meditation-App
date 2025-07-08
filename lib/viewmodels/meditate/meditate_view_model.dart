import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditate_view_model.g.dart';

@riverpod
class MeditateViewModel extends _$MeditateViewModel {
  @override
  int build() {
    return 0; // default index selected (e.g., index 0)
  }

  void select(int index) {
    state = index;
  }
}
