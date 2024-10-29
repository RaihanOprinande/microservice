// To parse this JSON data, do
//
//     final listpegawaimodel = listpegawaimodelFromJson(jsonString);

import 'dart:convert';

Listpegawaimodel listpegawaimodelFromJson(String str) => Listpegawaimodel.fromJson(json.decode(str));

String listpegawaimodelToJson(Listpegawaimodel data) => json.encode(data.toJson());

class Listpegawaimodel {
  bool isSuccess;
  String message;
  List<Datum> data;

  Listpegawaimodel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory Listpegawaimodel.fromJson(Map<String, dynamic> json) => Listpegawaimodel(
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
  String namaPegawai;
  String noHp;
  String alamat;
  String email;
  String tglLahir;
  String jenisKelamin;
  String password;

  Datum({
    required this.id,
    required this.namaPegawai,
    required this.noHp,
    required this.alamat,
    required this.email,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.password,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    namaPegawai: json["nama_pegawai"],
    noHp: json["no_hp"],
    alamat: json["alamat"],
    email: json["email"],
    tglLahir: json["tgl_lahir"],
    jenisKelamin: json["jenis_kelamin"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_pegawai": namaPegawai,
    "no_hp": noHp,
    "alamat": alamat,
    "email": email,
    "tgl_lahir": tglLahir,
    "jenis_kelamin": jenisKelamin,
    "password": password,
  };
}
