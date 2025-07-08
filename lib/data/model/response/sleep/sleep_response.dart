import 'dart:convert';

class SleepResponse {
  final int? statusCode;
  final String? message;
  final List<Item>? items;

  SleepResponse({
    this.statusCode,
    this.message,
    this.items,
  });

  factory SleepResponse.fromJson(String str) =>
      SleepResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SleepResponse.fromMap(Map<String, dynamic> json) => SleepResponse(
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
  final String? description;
  final String? url;
  final int? favorite;
  final int? listener;

  Item({
    this.id,
    this.filename,
    this.name,
    this.time,
    this.type,
    this.description,
    this.url,
    this.favorite,
    this.listener,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        filename: json["filename"],
        name: json["name"],
        time: json["time"],
        type: json["type"],
        description: json["description"],
        url: json["url"],
        favorite: json["favorite"],
        listener: json["listener"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "filename": filename,
        "name": name,
        "time": time,
        "type": type,
        "description": description,
        "url": url,
        "favorite": favorite,
        "listener": listener,
      };

  @override
  String toString() {
    return 'Item(id: $id, name: $name, type: $type, time: $time, description: $description, favorite: $favorite, listener: $listener)';
  }
}
