import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/repositories/home/home_repository.dart';
import 'package:metidation_app/services/home/home_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/response/home/recommendation_response.dart';

part 'home_repository_impl.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  final homeServices = ref.watch(homeServicesProvider);
  return HomeRepositoryImpl(homeServices);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeServices _homeServices;

  HomeRepositoryImpl(this._homeServices);

  @override
  Future<RecommendationResponse> getRecommendation() =>
      _homeServices.getRecommendations();
}
