import 'package:metidation_app/data/repositories/account/account_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/helpers/session_manager.dart';
import '../../data/model/response/account/account_response.dart';

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
      final repository = ref.read(accountRepositoryProvider);
      final uid = await SessionManager.getToken();
      final result = await repository.getAccountById(uid: uid ?? "");

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

class WelcomeState {
  final bool isLoading;
  final AccountResponse? response;
  final String? errorMessage;

  WelcomeState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  WelcomeState copyWith({
    bool? isLoading,
    AccountResponse? response,
    String? errorMessage,
  }) {
    return WelcomeState(
      isLoading: isLoading ?? this.isLoading,
      response: response,
      errorMessage: errorMessage,
    );
  }
}
