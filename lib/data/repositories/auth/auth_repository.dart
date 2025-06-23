import 'package:metidation_app/data/model/request/auth/login_request.dart';
import 'package:metidation_app/data/model/request/auth/register_request.dart';
import 'package:metidation_app/data/model/response/auth/login_response.dart';
import 'package:metidation_app/data/model/response/auth/register_response.dart';

abstract class AuthRepository {
  Future<RegisterResponseModel> register(RegisterRequestModel model);
  Future<LoginResponseModel> login(LoginRequestModel model);
}
