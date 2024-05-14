// To parse this JSON data, do
//
//     final package = packageFromJson(jsonString);

import 'dart:convert';
// ignore: implementation_imports
import 'package:flutter/src/material/dropdown.dart';

Package packageFromJson(String str) => Package.fromJson(json.decode(str));

String packageToJson(Package data) => json.encode(data.toJson());

class Package {
    bool success;
    List<PackageElement> package;

    Package({
        required this.success,
        required this.package,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        success: json["success"],
        package: List<PackageElement>.from(json["package"].map((x) => PackageElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "package": List<dynamic>.from(package.map((x) => x.toJson())),
    };

  map(DropdownMenuItem<String> Function(dynamic data) param0) {}
}

class PackageElement {
    int id;
    String name;
    String details;
    String cost;
    String maxValue;
    int partnerCost;
    int ins;
    int amb;
    int ph;
    int dv;
    int unionId;
    int empStatus;
    int cusStatus;
    DateTime createdAt;
    DateTime updatedAt;

    PackageElement({
        required this.id,
        required this.name,
        required this.details,
        required this.cost,
        required this.maxValue,
        required this.partnerCost,
        required this.ins,
        required this.amb,
        required this.ph,
        required this.dv,
        required this.unionId,
        required this.empStatus,
        required this.cusStatus,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PackageElement.fromJson(Map<String, dynamic> json) => PackageElement(
        id: json["id"],
        name: json["name"],
        details: json["details"]??"",
        cost: json["cost"],
        maxValue: json["max_value"],
        partnerCost: json["partner_cost"],
        ins: json["ins"]??0,
        amb: json["amb"]??0,
        ph: json["ph"]??0,
        dv: json["dv"]??0,
        unionId: json["union_id"],
        empStatus: json["emp_status"],
        cusStatus: json["cus_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "cost": cost,
        "max_value": maxValue,
        "partner_cost": partnerCost,
        "ins": ins,
        "amb": amb,
        "ph": ph,
        "dv": dv,
        "union_id": unionId,
        "emp_status": empStatus,
        "cus_status": cusStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
