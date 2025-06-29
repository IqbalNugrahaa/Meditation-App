import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/model/response/home/recommendation_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_services.g.dart';

@riverpod
HomeServices homeServices(Ref ref) {
  return HomeServices();
}

class HomeServices {
  Future<RecommendationResponse> getRecommendations() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('recommendations')
          .doc('items')
          .get();
      if (doc.exists) {
        return RecommendationResponse.fromMap(doc.data()!);
      }

      throw Exception('Recommendation not found.');
    } catch (e) {
      throw Exception('Failed to fetch Recommendation: $e');
    }
  }
}
