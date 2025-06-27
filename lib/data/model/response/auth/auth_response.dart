import 'dart:convert';

class AuthResponseModel {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool? emailVerified;
  final bool? isAnonymous;
  final String? providerId;
  final DateTime? createdAt;
  final DateTime? lastLoginAt;

  AuthResponseModel({
    this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.emailVerified,
    this.isAnonymous,
    this.providerId,
    this.createdAt,
    this.lastLoginAt,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        uid: json["uid"],
        email: json["email"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        emailVerified: json["emailVerified"],
        isAnonymous: json["isAnonymous"],
        providerId: json["providerId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastLoginAt: json["lastLoginAt"] == null
            ? null
            : DateTime.parse(json["lastLoginAt"]),
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "email": email,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "emailVerified": emailVerified,
        "isAnonymous": isAnonymous,
        "providerId": providerId,
        "createdAt": createdAt?.toIso8601String(),
        "lastLoginAt": lastLoginAt?.toIso8601String(),
      };
}
