import 'package:metidation_app/data/model/response/sleep/sleep_response.dart';

abstract class SleepRepository {
  Future<SleepResponse> getSleeps();
}
