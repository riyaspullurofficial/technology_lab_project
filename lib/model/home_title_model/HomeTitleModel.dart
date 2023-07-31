/*

class HomeTitleModel {
  HomeTitleModel({
      this.status, 
      this.message, 
      this.messageAr, 
      this.data,});

  HomeTitleModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    messageAr = json['message_ar'];
    data = json['data'] != null ? HomeTitleModelData.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  String? messageAr;
  HomeTitleModelData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['message_ar'] = messageAr;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class HomeTitleModelData {
  HomeTitleModelData({
    this.eTitle,
    this.aTitle,});

  HomeTitleModelData.fromJson(dynamic json) {
    eTitle = json['e_title'] != null ? json['e_title'].cast<String>() : [];
    aTitle = json['a_title'] != null ? json['a_title'].cast<String>() : [];
  }
  List<String>? eTitle;
  List<String>? aTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['e_title'] = eTitle;
    map['a_title'] = aTitle;
    return map;
  }

}*/
// To parse this JSON data, do
//
//     final homeTitleModel = homeTitleModelFromJson(jsonString);

import 'dart:convert';

HomeTitleModel homeTitleModelFromJson(String str) => HomeTitleModel.fromJson(json.decode(str));

String homeTitleModelToJson(HomeTitleModel data) => json.encode(data.toJson());

class HomeTitleModel {
  int? status;
  String? message;
  String? messageAr;
  HomeTitleModelData? data;

  HomeTitleModel({
    required this.status,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory HomeTitleModel.fromJson(Map<String, dynamic> json) => HomeTitleModel(
    status: json["status"],
    message: json["message"],
    messageAr: json["message_ar"],
    data: HomeTitleModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ar": messageAr,
    "data": data?.toJson(),
  };
}

class HomeTitleModelData {
  List<String>? eTitle;
  List<String>? aTitle;

  HomeTitleModelData({
    required this.eTitle,
    required this.aTitle,
  });

  factory HomeTitleModelData.fromJson(Map<String, dynamic> json) => HomeTitleModelData(
    eTitle: List<String>.from(json["e_title"].map((x) => x)),
    aTitle: List<String>.from(json["a_title"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "e_title": List<dynamic>.from(eTitle!.map((x) => x)),
    "a_title": List<dynamic>.from(aTitle!.map((x) => x)),
  };
}
