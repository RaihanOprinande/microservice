// To parse this JSON data, do
//
//     final loginpegawaiModel = loginpegawaiModelFromJson(jsonString);

import 'dart:convert';

LoginpegawaiModel loginpegawaiModelFromJson(String str) => LoginpegawaiModel.fromJson(json.decode(str));

String loginpegawaiModelToJson(LoginpegawaiModel data) => json.encode(data.toJson());

class LoginpegawaiModel {
  int value;
  String message;
  String namaPegawai;
  String email;

  LoginpegawaiModel({
    required this.value,
    required this.message,
    required this.namaPegawai,
    required this.email,
  });

  factory LoginpegawaiModel.fromJson(Map<String, dynamic> json) => LoginpegawaiModel(
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
