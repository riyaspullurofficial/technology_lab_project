

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int? status;
  String? message;
  String? messageAr;
  String? devOtp;
  String? phoneCode;
  String? phone;

  LoginResponse({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.devOtp,
    required this.phoneCode,
    required this.phone,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
    devOtp: json["dev_otp"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
    "dev_otp": devOtp,
    "phone_code": phoneCode,
    "phone": phone,
  };
}
