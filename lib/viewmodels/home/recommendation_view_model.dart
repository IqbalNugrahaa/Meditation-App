import 'package:metidation_app/data/model/response/home/recommendation_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/home/home_repository_impl.dart';

part 'recommendation_view_model.g.dart';

@riverpod
class RecommendationViewModel extends _$RecommendationViewModel {
  @override
  RecommendationState build() {
    return RecommendationState();
  }

  Future<void> getRecommendations() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      responseRecommendation: null,
      errorMessage: null,
    );

    try {
      final repository = ref.read(homeRepositoryProvider);
      final result = await repository.getRecommendation();

      state = state.copyWith(
        isLoading: false,
        responseRecommendation: result,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        responseRecommendation: null,
        errorMessage: e.toString(),
      );
    }
  }
}

class RecommendationState {
  final bool isLoading;
  RecommendationResponse? responseRecommendation;
  final String? errorMessage;

  RecommendationState({
    this.isLoading = false,
    this.responseRecommendation,
    this.errorMessage,
  });

  RecommendationState copyWith({
    bool? isLoading,
    RecommendationResponse? responseRecommendation,
    String? errorMessage,
  }) {
    return RecommendationState(
      isLoading: isLoading ?? this.isLoading,
      responseRecommendation: responseRecommendation,
      errorMessage: errorMessage,
    );
  }
}
