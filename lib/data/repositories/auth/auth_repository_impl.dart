import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/auth/auth_services.dart';
import '../../model/request/auth/login_request.dart';
import '../../model/request/auth/register_request.dart';
import '../../model/response/auth/login_response.dart';
import '../../model/response/auth/register_response.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServices _authServices;

  AuthRepositoryImpl(this._authServices);

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel model) =>
      _authServices.register(model);

  @override
  Future<LoginResponseModel> login(LoginRequestModel model) =>
      _authServices.login(model);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final authServices = ref.watch(authServiceProvider);
  return AuthRepositoryImpl(authServices);
}
