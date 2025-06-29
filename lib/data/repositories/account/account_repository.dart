import 'package:metidation_app/data/model/request/account/topic_request.dart';

import '../../model/response/account/account_response.dart';

abstract class AccountRepository {
  Future<String> updateTopic(TopicRequestModel model);

  Future<AccountResponse> getAccountById({
    required String uid,
  });
}
