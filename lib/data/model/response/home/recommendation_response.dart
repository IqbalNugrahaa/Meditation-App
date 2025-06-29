import 'dart:convert';

class RecommendationResponse {
  final String? statusCode;
  final String? message;
  final List<Item>? items;

  RecommendationResponse({
    this.statusCode,
    this.message,
    this.items,
  });

  factory RecommendationResponse.fromJson(String str) =>
      RecommendationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecommendationResponse.fromMap(Map<String, dynamic> json) =>
      RecommendationResponse(
        statusCode: json["status_code"],
        message: json["message"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status_code": statusCode,
        "message": message,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  final String? id;
  final String? filename;
  final String? name;
  final String? time;
  final String? type;

  Item({
    this.id,
    this.filename,
    this.name,
    this.time,
    this.type,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        filename: json["filename"],
        name: json["name"],
        time: json["time"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "filename": filename,
        "name": name,
        "time": time,
        "type": type,
      };

  @override
  String toString() {
    return 'Item(id: $id, name: $name, type: $type, time: $time)';
  }
}
