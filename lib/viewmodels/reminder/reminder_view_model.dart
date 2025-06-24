import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_view_model.g.dart';

@riverpod
class ReminderViewModel extends _$ReminderViewModel {
  @override
  TimePickerState build() => TimePickerState(
        hour: 0,
        minute: 0,
        selectedDays: {},
      );

  void setHour(int hour) => state = state.copyWith(hour: hour);

  void setMinute(int minute) => state = state.copyWith(minute: minute);

  // Multiple select: toggle day
  void toggleDay(int day) {
    final updatedDays = {...state.selectedDays};
    if (updatedDays.contains(day)) {
      updatedDays.remove(day);
    } else {
      updatedDays.add(day);
    }
    state = state.copyWith(selectedDays: updatedDays);
  }
}

class TimePickerState {
  final int hour;
  final int minute;
  final Set<int> selectedDays;

  TimePickerState({
    required this.hour,
    required this.minute,
    required this.selectedDays,
  });

  TimePickerState copyWith({
    int? hour,
    int? minute,
    Set<int>? selectedDays,
  }) {
    return TimePickerState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      selectedDays: selectedDays ?? this.selectedDays,
    );
  }
}
