import 'package:metidation_app/model/response/user/user_response_model.dart';
import 'package:metidation_app/services/user/user_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_view_model.g.dart';

@riverpod
class WelcomeViewModel extends _$WelcomeViewModel {
  @override
  WelcomeState build() {
    return WelcomeState();
  }

  Future<void> getUserById() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      response: null,
      errorMessage: null,
    );

    try {
      final user = ref.read(userServicesProvider);
      final result = await user.getUserById();

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

class WelcomeState {
  final bool isLoading;
  final Data? response;
  final String? errorMessage;

  WelcomeState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  WelcomeState copyWith({
    bool? isLoading,
    Data? response,
    String? errorMessage,
  }) {
    return WelcomeState(
      isLoading: isLoading ?? this.isLoading,
      response: response,
      errorMessage: errorMessage,
    );
  }
}
