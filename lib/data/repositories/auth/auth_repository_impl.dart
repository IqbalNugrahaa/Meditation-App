import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/data/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/auth/auth_services.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServices _authServices;

  AuthRepositoryImpl(this._authServices);

  @override
  Future<User?> register({
    required String email,
    required String password,
  }) =>
      _authServices.register(
        email: email,
        password: password,
      );

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) =>
      _authServices.login(
        email: email,
        password: password,
      );

  @override
  Future<User?> authWithGoogle() => _authServices.authWithGoogle();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final authServices = ref.watch(authServicesProvider);
  return AuthRepositoryImpl(authServices);
}
