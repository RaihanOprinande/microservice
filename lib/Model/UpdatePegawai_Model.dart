// To parse this JSON data, do
//
//     final updatepegawaiModel = updatepegawaiModelFromJson(jsonString);

import 'dart:convert';

UpdatepegawaiModel updatepegawaiModelFromJson(String str) => UpdatepegawaiModel.fromJson(json.decode(str));

String updatepegawaiModelToJson(UpdatepegawaiModel data) => json.encode(data.toJson());

class UpdatepegawaiModel {
  bool isSuccess;
  int value;
  String message;
  String namaPegawai;
  String tglLahir;
  String jenisKelamin;
  String email;
  String noHp;
  String alamat;
  String id;

  UpdatepegawaiModel({
    required this.isSuccess,
    required this.value,
    required this.message,
    required this.namaPegawai,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.id,
  });

  factory UpdatepegawaiModel.fromJson(Map<String, dynamic> json) => UpdatepegawaiModel(
    isSuccess: json["is_success"],
    value: json["value"],
    message: json["message"],
    namaPegawai: json["nama_pegawai"],
    tglLahir: json["tgl_lahir"],
    jenisKelamin: json["jenis_kelamin"],
    email: json["email"],
    noHp: json["no_hp"],
    alamat: json["alamat"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "value": value,
    "message": message,
    "nama_pegawai": namaPegawai,
    "tgl_lahir": tglLahir,
    "jenis_kelamin": jenisKelamin,
    "email": email,
    "no_hp": noHp,
    "alamat": alamat,
    "id": id,
  };
}
