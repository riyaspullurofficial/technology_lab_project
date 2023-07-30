

// To parse this JSON data, do
//
//     final errorResponseModel = errorResponseModelFromJson(jsonString);

import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponseModel data) => json.encode(data.toJson());

class ErrorResponseModel {
  int? status;
  String? message;
  String? messageAr;

  ErrorResponseModel({
    required this.status,
    required this.message,
    required this.messageAr,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
  };
}
