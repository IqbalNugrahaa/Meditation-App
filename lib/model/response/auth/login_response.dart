import 'dart:convert';

class RegisterResponseModel {
  final String? token;
  final String? error;

  RegisterResponseModel({
    this.token,
    this.error,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "error": error,
      };
}
