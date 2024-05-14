// To parse this JSON data, do
//
//     final smallCus = smallCusFromJson(jsonString);

import 'dart:convert';

SmallCus smallCusFromJson(String str) => SmallCus.fromJson(json.decode(str));

String smallCusToJson(SmallCus data) => json.encode(data.toJson());

class SmallCus {
  int id;
  String name;

  SmallCus({
    required this.id,
    required this.name,
  });

  factory SmallCus.fromJson(Map<String, dynamic> json) => SmallCus(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
