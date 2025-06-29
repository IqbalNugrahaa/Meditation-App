import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/helpers/session_manager.dart';
import 'package:metidation_app/data/model/request/account/topic_request.dart';
import 'package:metidation_app/data/model/response/account/account_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_services.g.dart';

@riverpod
AccountServices accountServices(Ref ref) => AccountServices();

class AccountServices {
  Future<String> updateTopic(TopicRequestModel model) async {
    try {
      final uid = await SessionManager.getUid();
      if (uid == null) return "User not logged in.";

      await FirebaseFirestore.instance.collection('accounts').doc(uid).update({
        'topic': model.toJson(),
        'updated_at': Timestamp.now(),
      });

      return 'Topic updated successfully.';
    } catch (e) {
      return 'Failed to update topic: $e';
    }
  }

  Future<AccountResponse> getAccountById({
    required String uid,
  }) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('accounts')
          .doc(uid)
          .get();
      if (doc.exists) {
        return AccountResponse.fromMap(doc.data()!);
      }

      throw Exception('User not found.');
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }
}
