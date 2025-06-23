import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_view_model.g.dart';

@riverpod
class TopicViewModel extends _$TopicViewModel {
  @override
  int? build() {
    return null; // default tidak ada yang dipilih
  }

  void select(int index) {
    state = index;
  }

  void clear() {
    state = null; // untuk reset pilihan jika diperlukan
  }
}
