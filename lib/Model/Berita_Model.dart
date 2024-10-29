// To parse this JSON data, do
//
//     final beritaModel = beritaModelFromJson(jsonString);

import 'dart:convert';

BeritaModel beritaModelFromJson(String str) => BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
  bool isSuccess;
  String message;
  List<Datum> data;

  BeritaModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String judulInfo;
  String tglInfo;
  String gambar;
  String konten;

  Datum({
    required this.id,
    required this.judulInfo,
    required this.tglInfo,
    required this.gambar,
    required this.konten,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judulInfo: json["judul_info"],
    tglInfo: json["tgl_info"],
    gambar: json["gambar"],
    konten: json["konten"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul_info": judulInfo,
    "tgl_info": tglInfo,
    "gambar": gambar,
    "konten": konten,
  };
}
