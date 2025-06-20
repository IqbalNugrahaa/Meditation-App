import 'dart:convert';

class RegisterResponseModel {
  final int? id;
  final String? token;
  final String? error;

  RegisterResponseModel({
    this.id,
    this.token,
    this.error,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        id: json["id"],
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "token": token,
        "error": error,
      };
}
