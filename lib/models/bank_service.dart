// To parse this JSON data, do
//
//     final bankServiceStatus = bankServiceStatusFromJson(jsonString);

import 'dart:convert';

BankServiceStatus bankServiceStatusFromJson(String str) =>
    BankServiceStatus.fromJson(json.decode(str));

String bankServiceStatusToJson(BankServiceStatus data) =>
    json.encode(data.toJson());

class BankServiceStatus {
  int id;
  String cusId;
  String packageId;
  dynamic cost;
  String details;
  dynamic kafeel;
  String status;
  String contract;
  dynamic reqType;
  DateTime createdAt;
  DateTime updatedAt;

  BankServiceStatus({
    required this.id,
    required this.cusId,
    required this.packageId,
    required this.cost,
    required this.details,
    required this.kafeel,
    required this.status,
    required this.contract,
    required this.reqType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankServiceStatus.fromJson(Map<String, dynamic> json) =>
      BankServiceStatus(
        id: json["id"],
        cusId: json["cus_id"],
        packageId: json["package_id"],
        cost: json["cost"],
        details: json["details"],
        kafeel: json["kafeel"],
        status: json["status"],
        contract: json["contract"],
        reqType: json["req_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cus_id": cusId,
        "package_id": packageId,
        "cost": cost,
        "details": details,
        "kafeel": kafeel,
        "status": status,
        "contract": contract,
        "req_type": reqType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
