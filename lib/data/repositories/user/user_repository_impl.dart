import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/repositories/user/user_repository.dart';
import 'package:metidation_app/services/user/user_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/response/user/user_response_model.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserServices _userServices;

  UserRepositoryImpl(this._userServices);

  @override
  Future<UserResponseModel> getUserById() => _userServices.getUserById();
}

@riverpod
UserRepository userRepository(
  Ref ref,
) {
  final userServices = ref.watch(userServicesProvider);
  return UserRepositoryImpl(userServices);
}
