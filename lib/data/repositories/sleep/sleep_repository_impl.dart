import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/repositories/sleep/sleep_repository.dart';
import 'package:metidation_app/services/sleep/sleep_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/response/sleep/sleep_response.dart';

part 'sleep_repository_impl.g.dart';

@riverpod
SleepRepository sleepRepository(Ref ref) => SleepRepositoryImpl(
      ref.watch(sleepServicesProvider),
    );

class SleepRepositoryImpl implements SleepRepository {
  final SleepServices _sleepServices;

  SleepRepositoryImpl(this._sleepServices);

  @override
  Future<SleepResponse> getSleeps() => _sleepServices.getSleeps();
}
