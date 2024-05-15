// To parse this JSON data, do
//
//     final medicalServiceStatus = medicalServiceStatusFromJson(jsonString);

import 'dart:convert';

MedicalServiceStatus medicalServiceStatusFromJson(String str) =>
    MedicalServiceStatus.fromJson(json.decode(str));

String medicalServiceStatusToJson(MedicalServiceStatus data) =>
    json.encode(data.toJson());

class MedicalServiceStatus {
  int id;
  String cusId;
  String packageId;
  int partnerId;
  String price;
  String details;
  String status;
  dynamic file;
  dynamic fail;
  DateTime createdAt;
  DateTime updatedAt;

  MedicalServiceStatus({
    required this.id,
    required this.cusId,
    required this.packageId,
    required this.partnerId,
    required this.price,
    required this.details,
    required this.status,
    required this.file,
    required this.fail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalServiceStatus.fromJson(Map<String, dynamic> json) =>
      MedicalServiceStatus(
        id: json["id"],
        cusId: json["cus_id"],
        packageId: json["package_id"],
        partnerId: json["partner_id"],
        price: json["price"],
        details: json["details"],
        status: json["status"],
        file: json["file"],
        fail: json["fail"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cus_id": cusId,
        "package_id": packageId,
        "partner_id": partnerId,
        "price": price,
        "details": details,
        "status": status,
        "file": file,
        "fail": fail,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
