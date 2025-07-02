import 'package:metidation_app/data/model/response/sleep/sleep_response.dart';
import 'package:metidation_app/data/repositories/sleep/sleep_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_recommendation_view_model.g.dart';

@riverpod
class SleepRecommendationViewModel extends _$SleepRecommendationViewModel {
  @override
  SleepRecommendationState build() {
    return SleepRecommendationState();
  }

  Future<void> getSleeps() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      response: null,
      errorMessage: null,
    );

    try {
      final repository = ref.read(sleepRepositoryProvider);
      final result = await repository.getSleeps();

      state = state.copyWith(
        isLoading: false,
        response: result,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        response: null,
        errorMessage: e.toString(),
      );
    }
  }
}

class SleepRecommendationState {
  final bool isLoading;
  SleepResponse? response;
  final String? errorMessage;

  SleepRecommendationState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  SleepRecommendationState copyWith({
    bool? isLoading,
    SleepResponse? response,
    String? errorMessage,
  }) {
    return SleepRecommendationState(
      isLoading: isLoading ?? this.isLoading,
      response: response,
      errorMessage: errorMessage,
    );
  }
}
