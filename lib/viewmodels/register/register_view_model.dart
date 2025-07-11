import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/app_strings.dart';

part 'register_view_model.g.dart';

@riverpod
class RegisterViewModel extends _$RegisterViewModel {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void toggleAgreement() {
    state = state.copyWith(
      isAgreed: !state.isAgreed,
      notificationId: state.notificationId + 1,
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    if (!state.isAgreed) {
      state = state.copyWith(
        toastMessage: "Please agree to the Terms & Conditions",
        notificationId: state.notificationId + 1,
      );
      return;
    }

    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      errorTextField: null,
      toastMessage: null,
      isSuccess: false,
      notificationId: state.notificationId + 1,
    );

    try {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        successMessage: AppStrings.msgSuccessLogin,
        notificationId: state.notificationId + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorTextField: null,
        toastMessage: e.toString(),
        notificationId: state.notificationId + 1,
      );
    }
  }

  Future<void> authWithGoogle() async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      errorTextField: null,
      toastMessage: null,
      isSuccess: false,
      notificationId: state.notificationId + 1,
    );

    try {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        successMessage: AppStrings.msgSuccessLogin,
        notificationId: state.notificationId + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorTextField: null,
        toastMessage: e.toString(),
        notificationId: state.notificationId + 1,
      );
    }
  }
}

class RegisterState {
  final bool isLoading;
  final bool isAgreed;
  final bool isSuccess;
  final String? errorTextField; // ❗ Error khusus untuk TextField
  final String? toastMessage; // ❗ Untuk FlutterToast saja
  final String? successMessage;
  final int notificationId;

  RegisterState({
    this.isLoading = false,
    this.isAgreed = false,
    this.isSuccess = false,
    this.errorTextField,
    this.toastMessage,
    this.successMessage,
    this.notificationId = 0,
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? isAgreed,
    bool? isSuccess,
    String? errorTextField,
    String? toastMessage,
    String? successMessage,
    int? notificationId,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isAgreed: isAgreed ?? this.isAgreed,
      isSuccess: isSuccess ?? this.isSuccess,
      errorTextField: errorTextField,
      toastMessage: toastMessage,
      successMessage: successMessage ?? this.successMessage,
      notificationId: notificationId ?? this.notificationId,
    );
  }
}
