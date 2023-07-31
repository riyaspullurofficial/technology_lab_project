

// To parse this JSON data, do
//
//     final getTestimonialResponseModel = getTestimonialResponseModelFromJson(jsonString);

import 'dart:convert';

GetTestimonialResponseModel getTestimonialResponseModelFromJson(String str) => GetTestimonialResponseModel.fromJson(json.decode(str));

String getTestimonialResponseModelToJson(GetTestimonialResponseModel data) => json.encode(data.toJson());

class GetTestimonialResponseModel {
  int? status;
  String? message;
  String? messageAr;
  List<GetTestimonialResponseModelDatum>? data;

  GetTestimonialResponseModel({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory GetTestimonialResponseModel.fromJson(Map<String, dynamic> json) => GetTestimonialResponseModel(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
    data: List<GetTestimonialResponseModelDatum>.from(json["data"].map((x) => GetTestimonialResponseModelDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetTestimonialResponseModelDatum {
  int? id;
  String? eName;
  String? aName;
  String? eDesignation;
  String? aDesignation;
  String? eComment;
  String? aComment;
  String? image;
  String? thumbImage;
  String? createdAt;

  GetTestimonialResponseModelDatum({
    required this.id,
    required this.eName,
    required this.aName,
    required this.eDesignation,
    required this.aDesignation,
    required this.eComment,
    required this.aComment,
    required this.image,
    required this.thumbImage,
    required this.createdAt,
  });

  factory GetTestimonialResponseModelDatum.fromJson(Map<String, dynamic> json) => GetTestimonialResponseModelDatum(
    id: json["id"],
    eName: json["e_name"],
    aName: json["a_name"],
    eDesignation: json["e_designation"],
    aDesignation: json["a_designation"],
    eComment: json["e_comment"],
    aComment: json["a_comment"],
    image: json["image"],
    thumbImage: json["thumb_image"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "e_name": eName,
    "a_name": aName,
    "e_designation": eDesignation,
    "a_designation": aDesignation,
    "e_comment": eComment,
    "a_comment": aComment,
    "image": image,
    "thumb_image": thumbImage,
    "created_at": createdAt,
  };
}
