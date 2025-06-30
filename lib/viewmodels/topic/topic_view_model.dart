import 'package:metidation_app/core/helpers/session_manager.dart';
import 'package:metidation_app/data/repositories/account/account_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/request/account/topic_request.dart';

part 'topic_view_model.g.dart';

@riverpod
class TopicViewModel extends _$TopicViewModel {
  @override
  TopicState build() => TopicState();

  void select({
    required String topicId,
    required String topicName,
  }) {
    state = state.copyWith(
      topicId: topicId,
      topicName: topicName,
    );
  }

  void clear() {
    state = state.copyWith(
      topicId: null,
      topicName: null,
    ); // untuk reset pilihan jika diperlukan
  }

  Future<void> updateTopic(TopicRequestModel model) async {
    // Reset dulu error sebelum loading
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      notificationId: state.notificationId + 1,
    );

    try {
      final repository = ref.read(accountRepositoryProvider);
      final result = await repository.updateTopic(model);

      await SessionManager.saveTopic(model);
      state = state.copyWith(
        isLoading: false,
        successMessage: result,
        errorMessage: null,
        notificationId: state.notificationId + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        successMessage: null,
        notificationId: state.notificationId + 1,
      );
    }
  }
}

class TopicState {
  final String? topicId;
  final String? topicName;
  final bool isLoading;
  final int notificationId;
  final String? successMessage;
  final String? errorMessage;

  TopicState({
    this.topicId,
    this.topicName,
    this.isLoading = false,
    this.notificationId = 0,
    this.successMessage,
    this.errorMessage,
  });

  TopicState copyWith({
    String? topicName,
    String? topicId,
    bool? isLoading,
    int? notificationId,
    String? successMessage,
    String? errorMessage,
  }) {
    return TopicState(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      isLoading: isLoading ?? this.isLoading,
      notificationId: notificationId ?? this.notificationId,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
