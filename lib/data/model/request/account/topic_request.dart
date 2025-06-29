import 'dart:convert';

class TopicRequestModel {
  final String id;
  final String name;

  TopicRequestModel({
    required this.id,
    required this.name,
  });

  factory TopicRequestModel.fromJson(String str) =>
      TopicRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TopicRequestModel.fromMap(Map<String, dynamic> json) =>
      TopicRequestModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
