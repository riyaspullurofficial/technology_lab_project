

// To parse this JSON data, do
//
//     final verifyOtpUploadModel = verifyOtpUploadModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpUploadModel verifyOtpUploadModelFromJson(String str) => VerifyOtpUploadModel.fromJson(json.decode(str));

String verifyOtpUploadModelToJson(VerifyOtpUploadModel data) => json.encode(data.toJson());

class VerifyOtpUploadModel {
  String otp;

  VerifyOtpUploadModel({
    required this.otp,
  });

  factory VerifyOtpUploadModel.fromJson(Map<String, dynamic> json) => VerifyOtpUploadModel(
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}
