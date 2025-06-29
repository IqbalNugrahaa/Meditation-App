import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/helpers/session_manager.dart';
import '../../data/model/response/account/account_response.dart';
import '../../data/repositories/account/account_repository_impl.dart';

part 'account_view_model.g.dart';

@riverpod
class AccountViewModel extends _$AccountViewModel {
  @override
  AccountState build() {
    return AccountState();
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

class AccountState {
  final bool isLoading;
  final AccountResponse? response;
  final String? errorMessage;

  AccountState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  AccountState copyWith({
    bool? isLoading,
    AccountResponse? response,
    String? errorMessage,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      response: response,
      errorMessage: errorMessage,
    );
  }
}
