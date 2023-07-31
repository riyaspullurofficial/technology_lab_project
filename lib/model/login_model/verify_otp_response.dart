// To parse this JSON data, do
//
//     final verifyOtpResponseModel = verifyOtpResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) => VerifyOtpResponseModel.fromJson(json.decode(str));

String verifyOtpResponseModelToJson(VerifyOtpResponseModel data) => json.encode(data.toJson());

class VerifyOtpResponseModel {
  int? status;
  String? message;
  String? messageAr;
  VerifyOtpResponseModelData? data;

  VerifyOtpResponseModel({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) => VerifyOtpResponseModel(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
    data: VerifyOtpResponseModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
    "data": data?.toJson(),
  };
}

class VerifyOtpResponseModelData {
  int? id;
  String? name;
  String? email;
  String? phoneCode;
  String? phone;
  String? phoneWithCode;
  String? token;

  VerifyOtpResponseModelData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneCode,
    required this.phone,
    required this.phoneWithCode,
    required this.token,
  });

  factory VerifyOtpResponseModelData.fromJson(Map<String, dynamic> json) => VerifyOtpResponseModelData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    phoneWithCode: json["phone_with_code"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_code": phoneCode,
    "phone": phone,
    "phone_with_code": phoneWithCode,
    "token": token,
  };
}
