import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/model/response/user/user_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_services.g.dart';

@riverpod
UserServices userServices(Ref ref) {
  final baseUrl = dotenv.env['API_BASE_URL'];
  final apiKey = dotenv.env['API_KEY'];

  if (baseUrl == null || apiKey == null) {
    throw Exception('API_BASE_URL or API_KEY is missing in .env');
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "x-api-key": apiKey,
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    logPrint: (object) => log(object.toString()),
  ));

  return UserServices(dio);
}

class UserServices {
  final Dio _dio;
  UserServices(this._dio);

  Future<UserResponseModel> getUserById() async {
    try {
      final response = await _dio.get(
        '/api/users/2',
      );

      return UserResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        return UserResponseModel.fromMap(e.response!.data);
      }

      // Kalau tidak → lempar exception biasa
      throw Exception(e.message ?? 'Signup failed');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
