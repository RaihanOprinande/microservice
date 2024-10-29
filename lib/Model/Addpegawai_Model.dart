// To parse this JSON data, do
//
//     final addpegawaiModel = addpegawaiModelFromJson(jsonString);

import 'dart:convert';

AddpegawaiModel addpegawaiModelFromJson(String str) => AddpegawaiModel.fromJson(json.decode(str));

String addpegawaiModelToJson(AddpegawaiModel data) => json.encode(data.toJson());

class AddpegawaiModel {
  int value;
  String message;

  AddpegawaiModel({
    required this.value,
    required this.message,
  });

  factory AddpegawaiModel.fromJson(Map<String, dynamic> json) => AddpegawaiModel(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
