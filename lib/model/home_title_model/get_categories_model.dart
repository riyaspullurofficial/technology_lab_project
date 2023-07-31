// To parse this JSON data, do
//
//     final getCategoriesResponseModel = getCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

GetCategoriesResponseModel getCategoriesResponseModelFromJson(String str) =>
    GetCategoriesResponseModel.fromJson(json.decode(str));

String getCategoriesResponseModelToJson(GetCategoriesResponseModel data) =>
    json.encode(data.toJson());

class GetCategoriesResponseModel {
  int status;
  String message;
  String messageAr;
  List<GetCategoriesResponseModelDatum> data;

  GetCategoriesResponseModel({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory GetCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCategoriesResponseModel(
        status: json["status"],
        message: json["message"],
        messageAr: json["message_ar"],
        data: List<GetCategoriesResponseModelDatum>.from(json["data"]
            .map((x) => GetCategoriesResponseModelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ar": messageAr,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetCategoriesResponseModelDatum {
  int id;
  String slug;
  String eName;
  String aName;
  String image;
  String thumbImage;
  int subcategoryCount;
  int tripCount;

  GetCategoriesResponseModelDatum({
    required this.id,
    required this.slug,
    required this.eName,
    required this.aName,
    required this.image,
    required this.thumbImage,
    required this.subcategoryCount,
    required this.tripCount,
  });

  factory GetCategoriesResponseModelDatum.fromJson(Map<String, dynamic> json) =>
      GetCategoriesResponseModelDatum(
        id: json["id"],
        slug: json["slug"],
        eName: json["e_name"],
        aName: json["a_name"],
        image: json["image"],
        thumbImage: json["thumb_image"],
        subcategoryCount: json["subcategory_count"],
        tripCount: json["trip_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "e_name": eName,
        "a_name": aName,
        "image": image,
        "thumb_image": thumbImage,
        "subcategory_count": subcategoryCount,
        "trip_count": tripCount,
      };
}
