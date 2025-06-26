import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/response/user/user_response_model.dart';
import '../../data/repositories/user/user_repository_impl.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> getUserById() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      response: null,
      errorMessage: null,
    );

    try {
      final repository = ref.read(userRepositoryProvider);
      final result = await repository.getUserById();

      if (result.data != null) {
        state = state.copyWith(
          isLoading: false,
          response: result.data,
          errorMessage: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: result.data?.email ?? "-",
          response: null,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        response: null,
        errorMessage: e.toString(),
      );
    }
  }
}

class HomeState {
  final bool isLoading;
  final Data? response;
  final String? errorMessage;

  HomeState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? isLoading,
    Data? response,
    String? errorMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      response: response,
      errorMessage: errorMessage,
    );
  }
}
