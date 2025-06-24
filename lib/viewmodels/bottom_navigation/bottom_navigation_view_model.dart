import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_view_model.g.dart';

@riverpod
class BottomNavigationViewModel extends _$BottomNavigationViewModel {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
