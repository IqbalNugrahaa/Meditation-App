import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'back_press_view_model.g.dart';

@riverpod
class BackPressViewModel extends _$BackPressViewModel {
  @override
  DateTime? build() => null;

  void shouldExitNow(Function(bool shouldExit) onResult) {
    final now = DateTime.now();

    if (state == null || now.difference(state!) > const Duration(seconds: 2)) {
      state = now;
      onResult(false); // ❗ jangan keluar → tampilkan toast
    } else {
      onResult(true); // ❗ keluar → sudah 2x klik dalam 2 detik
    }
  }
}
