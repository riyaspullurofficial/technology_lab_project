
// To parse this JSON data, do
//
//     final loginUploadModel = loginUploadModelFromJson(jsonString);

import 'dart:convert';

LoginUploadModel loginUploadModelFromJson(String str) => LoginUploadModel.fromJson(json.decode(str));

String loginUploadModelToJson(LoginUploadModel data) => json.encode(data.toJson());

class LoginUploadModel {
  String phoneCode;
  String phone;

  LoginUploadModel({
    required this.phoneCode,
    required this.phone,
  });

  factory LoginUploadModel.fromJson(Map<String, dynamic> json) => LoginUploadModel(
    phoneCode: json["phone_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone_code": phoneCode,
    "phone": phone,
  };
}
