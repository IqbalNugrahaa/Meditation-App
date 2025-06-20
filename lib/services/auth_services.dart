import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/model/request/auth/register_request.dart';
import 'package:metidation_app/model/response/auth/register_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_services.g.dart';

@riverpod
AuthServices authService(Ref ref) {
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

  return AuthServices(dio);
}

class AuthServices {
  final Dio _dio;
  AuthServices(this._dio);

  Future<RegisterResponseModel> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      final response = await _dio.post(
        '/api/register',
        data: registerRequestModel.toJson(),
      );

      return RegisterResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        return RegisterResponseModel.fromMap(e.response!.data);
      }

      // Kalau tidak → lempar exception biasa
      throw Exception(e.message ?? 'Signup failed');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
