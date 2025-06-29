import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/model/request/account/topic_request.dart';
import 'package:metidation_app/data/model/response/account/account_response.dart';
import 'package:metidation_app/data/repositories/account/account_repository.dart';
import 'package:metidation_app/services/account/account_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository_impl.g.dart';

@riverpod
AccountRepository accountRepository(Ref ref) {
  final accountServices = ref.watch(accountServicesProvider);
  return AccountRepositoryImpl(accountServices);
}

class AccountRepositoryImpl implements AccountRepository {
  final AccountServices _accountServices;

  AccountRepositoryImpl(this._accountServices);

  @override
  Future<String> updateTopic(TopicRequestModel model) =>
      _accountServices.updateTopic(model);

  @override
  Future<AccountResponse> getAccountById({
    required String uid,
  }) =>
      _accountServices.getAccountById(uid: uid);
}
