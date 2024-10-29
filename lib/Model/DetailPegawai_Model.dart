// To parse this JSON data, do
//
//     final detailpegawaimodel = detailpegawaimodelFromJson(jsonString);

import 'dart:convert';

Detailpegawaimodel detailpegawaimodelFromJson(String str) => Detailpegawaimodel.fromJson(json.decode(str));

String detailpegawaimodelToJson(Detailpegawaimodel data) => json.encode(data.toJson());

class Detailpegawaimodel {
  int value;
  String message;
  String namaPegawai;
  String email;

  Detailpegawaimodel({
    required this.value,
    required this.message,
    required this.namaPegawai,
    required this.email,
  });

  factory Detailpegawaimodel.fromJson(Map<String, dynamic> json) => Detailpegawaimodel(
    value: json["value"],
    message: json["message"],
    namaPegawai: json["nama_pegawai"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "nama_pegawai": namaPegawai,
    "email": email,
  };
}
