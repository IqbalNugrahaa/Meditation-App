import 'package:metidation_app/data/model/response/user/user_response_model.dart';

abstract class UserRepository {
  Future<UserResponseModel> getUserById();
}
