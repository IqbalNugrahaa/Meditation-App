import 'package:metidation_app/data/model/response/home/recommendation_response.dart';

abstract class HomeRepository {
  Future<RecommendationResponse> getRecommendation();
}
