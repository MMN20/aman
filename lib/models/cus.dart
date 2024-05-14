// To parse this JSON data, do
//
//     final cus = cusFromJson(jsonString);

import 'dart:convert';

Cus cusFromJson(String str) => Cus.fromJson(json.decode(str));

String cusToJson(Cus data) => json.encode(data.toJson());

class Cus {
  bool success;
  CusClass cus;

  Cus({
    required this.success,
    required this.cus,
  });

  factory Cus.fromJson(Map<String, dynamic> json) => Cus(
        success: json["success"],
        cus: CusClass.fromJson(json["cus"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "cus": cus.toJson(),
      };
}

class CusClass {
  int id;
  String name;
  String phone;
  String password;
  String mother;
  String dob;
  String address;
  dynamic email;
  String point;
  String govId;
  String packageId;
  String unionId;
  dynamic guildId;
  dynamic guildSubId;
  String job;
  String workYears;
  String jobAddress;
  String country;
  String cardId;
  String cardNo;
  String insurance;
  dynamic govInsurance;
  dynamic reverral;
  String reverralUser;
  dynamic employeerId;
  String joinDate;
  String endDate;
  String nameEn;
  String gender;
  String img;
  String categorize;
  int jobGovs;
  int q1;
  int q2;
  int q3;
  int q4;
  int q5;
  int q6;
  int q7;
  int q8;
  int q9;
  int q10;
  int q11;
  int q12;
  int q13;
  int q14;
  int q15;
  int q16;
  int q17;
  dynamic note;
  String userId;
  int status;
  String adjective;
  int cusType;
  int deliveryStatus;
  dynamic policeStatus;
  int certificateStatus;
  String createdAt;
  String updatedAt;
  Partner union;
  dynamic employeer;
  User user;
  dynamic guild;
  dynamic guildsub;
  Govs govs;
  Partner partner;
  List<Img> imgs;
  Storea storea;

  CusClass({
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.mother,
    required this.dob,
    required this.address,
    required this.email,
    required this.point,
    required this.govId,
    required this.packageId,
    required this.unionId,
    required this.guildId,
    required this.guildSubId,
    required this.job,
    required this.workYears,
    required this.jobAddress,
    required this.country,
    required this.cardId,
    required this.cardNo,
    required this.insurance,
    required this.govInsurance,
    required this.reverral,
    required this.reverralUser,
    required this.employeerId,
    required this.joinDate,
    required this.endDate,
    required this.nameEn,
    required this.gender,
    required this.img,
    required this.categorize,
    required this.jobGovs,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
    required this.q11,
    required this.q12,
    required this.q13,
    required this.q14,
    required this.q15,
    required this.q16,
    required this.q17,
    required this.note,
    required this.userId,
    required this.status,
    required this.adjective,
    required this.cusType,
    required this.deliveryStatus,
    required this.policeStatus,
    required this.certificateStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.union,
    required this.employeer,
    required this.user,
    required this.guild,
    required this.guildsub,
    required this.govs,
    required this.partner,
    required this.imgs,
    required this.storea,
  });

  factory CusClass.fromJson(Map<String, dynamic> json) => CusClass(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        mother: json["mother"],
        dob: json["dob"],
        address: json["address"],
        email: json["email"],
        point: json["point"],
        govId: json["gov_id"],
        packageId: json["package_id"],
        unionId: json["union_id"],
        guildId: json["guild_id"],
        guildSubId: json["guild_sub_id"],
        job: json["job"],
        workYears: json["work_years"],
        jobAddress: json["job_address"],
        country: json["country"],
        cardId: json["card_id"],
        cardNo: json["card_no"],
        insurance: json["insurance"],
        govInsurance: json["gov_insurance"],
        reverral: json["reverral"],
        reverralUser: json["reverral_user"],
        employeerId: json["employeer_id"],
        joinDate: json["join_date"],
        endDate: json["end_date"],
        nameEn: json["name_en"],
        gender: json["gender"],
        img: json["img"],
        categorize: json["categorize"],
        jobGovs: json["job_govs"],
        q1: json["q1"],
        q2: json["q2"],
        q3: json["q3"],
        q4: json["q4"],
        q5: json["q5"],
        q6: json["q6"],
        q7: json["q7"],
        q8: json["q8"],
        q9: json["q9"],
        q10: json["q10"],
        q11: json["q11"],
        q12: json["q12"],
        q13: json["q13"],
        q14: json["q14"],
        q15: json["q15"],
        q16: json["q16"],
        q17: json["q17"],
        note: json["note"],
        userId: json["user_id"],
        status: json["status"],
        adjective: json["adjective"],
        cusType: json["cus_type"],
        deliveryStatus: json["delivery_status"],
        policeStatus: json["police_status"],
        certificateStatus: json["certificate_status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        union: Partner.fromJson(json["union"]),
        employeer: json["employeer"],
        user: User.fromJson(json["user"]),
        guild: json["guild"],
        guildsub: json["guildsub"],
        govs: Govs.fromJson(json["govs"]),
        partner: Partner.fromJson(json["partner"]),
        imgs: List<Img>.from(json["imgs"].map((x) => Img.fromJson(x))),
        storea: Storea.fromJson(json["storea"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "password": password,
        "mother": mother,
        "dob": dob,
        "address": address,
        "email": email,
        "point": point,
        "gov_id": govId,
        "package_id": packageId,
        "union_id": unionId,
        "guild_id": guildId,
        "guild_sub_id": guildSubId,
        "job": job,
        "work_years": workYears,
        "job_address": jobAddress,
        "country": country,
        "card_id": cardId,
        "card_no": cardNo,
        "insurance": insurance,
        "gov_insurance": govInsurance,
        "reverral": reverral,
        "reverral_user": reverralUser,
        "employeer_id": employeerId,
        "join_date": joinDate,
        "end_date": endDate,
        "name_en": nameEn,
        "gender": gender,
        "img": img,
        "categorize": categorize,
        "job_govs": jobGovs,
        "q1": q1,
        "q2": q2,
        "q3": q3,
        "q4": q4,
        "q5": q5,
        "q6": q6,
        "q7": q7,
        "q8": q8,
        "q9": q9,
        "q10": q10,
        "q11": q11,
        "q12": q12,
        "q13": q13,
        "q14": q14,
        "q15": q15,
        "q16": q16,
        "q17": q17,
        "note": note,
        "user_id": userId,
        "status": status,
        "adjective": adjective,
        "cus_type": cusType,
        "delivery_status": deliveryStatus,
        "police_status": policeStatus,
        "certificate_status": certificateStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "union": union.toJson(),
        "employeer": employeer,
        "user": user.toJson(),
        "guild": guild,
        "guildsub": guildsub,
        "govs": govs.toJson(),
        "partner": partner.toJson(),
        "imgs": List<dynamic>.from(imgs.map((x) => x.toJson())),
        "storea": storea.toJson(),
      };
}

class Govs {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  Govs({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Govs.fromJson(Map<String, dynamic> json) => Govs(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Img {
  int id;
  String cusId;
  dynamic reqId;
  String img;
  String createdAt;
  String updatedAt;

  Img({
    required this.id,
    required this.cusId,
    required this.reqId,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"],
        cusId: json["cus_id"],
        reqId: json["req_id"],
        img: json["img"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cus_id": cusId,
        "req_id": reqId,
        "img": img,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Partner {
  int id;
  String name;
  String govId;
  String userId;
  String costPersent;
  String cost;
  String img;
  String sign;
  String createdAt;
  String updatedAt;

  Partner({
    required this.id,
    required this.name,
    required this.govId,
    required this.userId,
    required this.costPersent,
    required this.cost,
    required this.img,
    required this.sign,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        id: json["id"],
        name: json["name"],
        govId: json["gov_id"],
        userId: json["user_id"],
        costPersent: json["cost_persent"],
        cost: json["cost"],
        img: json["img"],
        sign: json["sign"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gov_id": govId,
        "user_id": userId,
        "cost_persent": costPersent,
        "cost": cost,
        "img": img,
        "sign": sign,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Storea {
  int id;
  String amount;
  String opType;
  int accountId;
  String details;
  String userId;
  String billId;
  String cusId;
  String status;
  String createdAt;
  String updatedAt;
  Account account;

  Storea({
    required this.id,
    required this.amount,
    required this.opType,
    required this.accountId,
    required this.details,
    required this.userId,
    required this.billId,
    required this.cusId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.account,
  });

  factory Storea.fromJson(Map<String, dynamic> json) => Storea(
        id: json["id"],
        amount: json["amount"],
        opType: json["op_type"],
        accountId: json["account_id"],
        details: json["details"],
        userId: json["user_id"],
        billId: json["bill_id"],
        cusId: json["cus_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        account: Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "op_type": opType,
        "account_id": accountId,
        "details": details,
        "user_id": userId,
        "bill_id": billId,
        "cus_id": cusId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "account": account.toJson(),
      };
}

class Account {
  int id;
  String name;
  String phone;
  String phoneHome;
  String address;
  String point;
  String workAddress;
  String relatedName;
  String relatedPhone;
  String relatedAddress;
  int unionId;
  String createdAt;
  String updatedAt;

  Account({
    required this.id,
    required this.name,
    required this.phone,
    required this.phoneHome,
    required this.address,
    required this.point,
    required this.workAddress,
    required this.relatedName,
    required this.relatedPhone,
    required this.relatedAddress,
    required this.unionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        phoneHome: json["phone_home"],
        address: json["address"],
        point: json["point"],
        workAddress: json["work_address"],
        relatedName: json["related_name"],
        relatedPhone: json["related_phone"],
        relatedAddress: json["related_address"],
        unionId: json["union_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "phone_home": phoneHome,
        "address": address,
        "point": point,
        "work_address": workAddress,
        "related_name": relatedName,
        "related_phone": relatedPhone,
        "related_address": relatedAddress,
        "union_id": unionId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class User {
  int id;
  String name;
  String email;
  String phone;
  String password;
  String passwordShow;
  String type;
  String position;
  int unionId;
  dynamic guildId;
  int orgId;
  dynamic partnerId;
  String salary;
  String active;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordShow,
    required this.type,
    required this.position,
    required this.unionId,
    required this.guildId,
    required this.orgId,
    required this.partnerId,
    required this.salary,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        password: json["password"] ?? "",
        passwordShow: json["password_show"] ?? "",
        type: json["type"] ?? "",
        position: json["position"] ?? "",
        unionId: json["union_id"] ?? 0,
        guildId: json["guild_id"],
        orgId: json["org_id"] ?? 0,
        partnerId: json["partner_id"],
        salary: json["salary"] ?? "",
        active: json["active"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_show": passwordShow,
        "type": type,
        "position": position,
        "union_id": unionId,
        "guild_id": guildId,
        "org_id": orgId,
        "partner_id": partnerId,
        "salary": salary,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
