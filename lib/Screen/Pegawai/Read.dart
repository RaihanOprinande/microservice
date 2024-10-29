import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Model/ListPegawai_Model.dart';


class PageDetailPegawai extends StatelessWidget {

  //konstruktor penampung data
  final Datum? data;
  const PageDetailPegawai({super.key,this.data,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
            data!.namaPegawai
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Nama pegawai      = ${data?.namaPegawai}" ),
          SizedBox(height: 8,),
          Text("Nomor handphone   = ${data?.noHp}" ),
          SizedBox(height: 8,),
          Text("Alamat            = ${data?.alamat}" ),
          SizedBox(height: 8,),
          Text("Email             = ${data?.email}" ),
          SizedBox(height: 8,),
          Text("Tanggal lahir     = ${data?.tglLahir}" ),
          SizedBox(height: 8,),
          Text("Jenis kelamin     = ${data?.jenisKelamin}" ),
        ],
      ),
    );
  }
}
