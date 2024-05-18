// To parse this JSON data, do
//
//     final lawClaim = lawClaimFromJson(jsonString);

import 'dart:convert';

LawClaim lawClaimFromJson(String str) => LawClaim.fromJson(json.decode(str));

String lawClaimToJson(LawClaim data) => json.encode(data.toJson());

class LawClaim {
  int id;
  int cusId;
  String reqDesc;
  String reqType;
  String claimType;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic fail;

  LawClaim({
    required this.id,
    required this.cusId,
    required this.reqDesc,
    required this.reqType,
    required this.claimType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fail,
  });

  factory LawClaim.fromJson(Map<String, dynamic> json) => LawClaim(
        id: json["id"],
        cusId: json["cus_id"],
        reqDesc: json["req_desc"],
        reqType: json["req_type"],
        claimType: json["claim_type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fail: json["fail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cus_id": cusId,
        "req_desc": reqDesc,
        "req_type": reqType,
        "claim_type": claimType,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "fail": fail,
      };
}
