

// To parse this JSON data, do
//
//     final getSlidersResponseModel = getSlidersResponseModelFromJson(jsonString);

import 'dart:convert';

GetSlidersResponseModel getSlidersResponseModelFromJson(String str) => GetSlidersResponseModel.fromJson(json.decode(str));

String getSlidersResponseModelToJson(GetSlidersResponseModel data) => json.encode(data.toJson());

class GetSlidersResponseModel {
  int? status;
  String? message;
  String? messageAr;
  List<GetSlidersResponseModelDatum> ?data;

  GetSlidersResponseModel({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory GetSlidersResponseModel.fromJson(Map<String, dynamic> json) => GetSlidersResponseModel(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
    data: List<GetSlidersResponseModelDatum>.from(json["data"].map((x) => GetSlidersResponseModelDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetSlidersResponseModelDatum {
  int? id;
  String? eImage;
  String? aImage;
  String? slug;

  GetSlidersResponseModelDatum({
    required this.id,
    required this.eImage,
    required this.aImage,
    required this.slug,
  });

  factory GetSlidersResponseModelDatum.fromJson(Map<String, dynamic> json) => GetSlidersResponseModelDatum(
    id: json["id"],
    eImage: json["e_image"],
    aImage: json["a_image"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "e_image": eImage,
    "a_image": aImage,
    "slug": slug,
  };
}
