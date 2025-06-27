import 'package:metidation_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/helpers/session_manager.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      errorTextField: null,
      errorMessage: null,
      isSuccess: false,
      notificationId: state.notificationId + 1,
    );

    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.login(
        email: email,
        password: password,
      );
      await SessionManager.saveSession(
        token: result!.uid,
        email: email,
      );
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        successMessage: result.uid,
        notificationId: state.notificationId + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorTextField: null,
        errorMessage: e.toString(),
        notificationId: state.notificationId + 1,
      );
    }
  }

  Future<void> authWithGoogle() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      errorTextField: null,
      errorMessage: null,
      isSuccess: false,
      notificationId: state.notificationId + 1,
    );

    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.authWithGoogle();
      await SessionManager.saveSession(
        token: result?.uid ?? "",
        email: result?.email ?? "-",
      );
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        successMessage: result?.uid,
        notificationId: state.notificationId + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorTextField: null,
        errorMessage: e.toString(),
        notificationId: state.notificationId + 1,
      );
    }
  }
}

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final int notificationId;
  final String? successMessage;
  final String? errorMessage;
  final String? errorTextField;

  LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.notificationId = 0,
    this.successMessage,
    this.errorMessage,
    this.errorTextField,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    int? notificationId,
    String? successMessage,
    String? errorMessage,
    String? errorTextField,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      notificationId: notificationId ?? this.notificationId,
      successMessage: successMessage,
      errorMessage: errorMessage,
      errorTextField: errorTextField,
    );
  }
}
