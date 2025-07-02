import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/model/response/sleep/sleep_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_services.g.dart';

@riverpod
SleepServices sleepServices(Ref ref) => SleepServices();

class SleepServices {
  Future<SleepResponse> getSleeps() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('sleep_recommendations')
          .doc('sleep_recommendations')
          .get();
      if (doc.exists) {
        return SleepResponse.fromMap(doc.data()!);
      }

      throw Exception('Recommendation not found.');
    } catch (e) {
      throw Exception('Failed to fetch Recommendation: $e');
    }
  }
}
