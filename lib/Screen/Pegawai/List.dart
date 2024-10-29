import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:microservice/Screen/Pegawai/Create.dart';
import 'package:microservice/Screen/Pegawai/Read.dart';
import 'package:microservice/Screen/Pegawai/Update.dart';

import '../../Model/ListPegawai_Model.dart';


class PageListPegawai extends StatefulWidget {
  const PageListPegawai({super.key});

  @override
  State<PageListPegawai> createState() => _PageListPegawaiState();
}

class _PageListPegawaiState extends State<PageListPegawai> {
  List<Datum>? filterdata;
  List<Datum>? listdata;
  bool isLoading = false;
  TextEditingController cari = TextEditingController();


  @override
  void initState() {
    super.initState();
    getData().then((notes) {
      setState(() {
        listdata = notes;
        filterdata = notes;
      });
    });
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    listdata = await getData();
    filterdata = listdata;
    setState(() {
      isLoading = false;
    });
  }

  Future<List<Datum>?> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse("http://172.21.240.1:7070/pegawai/listpegawai.php"),
      );
      return listpegawaimodelFromJson(response.body).data;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> deleteData(int id) async {
    try {
      final response = await http.post(
        Uri.parse("http://172.21.240.1:7070/pegawai/deletepegawai.php"),
        body: {'id': id.toString()},
      );

      final responseData = json.decode(response.body);
      if (responseData['isSuccess']) {
        // Pegawai berhasil dihapus
        print('Pegawai berhasil dihapus');

        // Tampilkan dialog berhasil dihapus
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sukses'),
              content: Text('Pegawai berhasil dihapus'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    fetchData(); // Fetch updated data
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Pegawai gagal dihapus
        print('Pegawai gagal dihapus');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('List Pegawai'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addpegawais(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.indigo),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: cari,
                    onChanged: (value) {
                      setState(() {
                        filterdata = listdata
                            ?.where((element) =>
                        element.namaPegawai!
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                            element.noHp!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              )
          ),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
                if (snapshot.hasData) {
                  listdata = snapshot.data;
                  if (filterdata == null) {
                    filterdata = listdata;
                  }
                  return ListView.builder(
                    itemCount: filterdata!.length,
                    itemBuilder: (context, index) {
                      Datum? data = filterdata?[index];
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageDetailPegawai(data: data),
                                ),
                              );
                            },
                            child:Card(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // ClipRect(
                                        //   child: Image.network(
                                        //       "http://localhost/intermediate/wisata/gambar/${data?.gambarWisata}"
                                        //   ),
                                        // ),
                                        Text("Nama mahasiswa : ${data?.namaPegawai}"),
                                        SizedBox(height: 10),
                                        Text("No BP : ${data?.noHp}"),
                                        SizedBox(height: 10),
                                        // Text("No BP : ${data?.noHp}"),
                                        // SizedBox(height: 10),
                                        Text("Email : ${data?.email}"),
                                        SizedBox(height: 10),
                                        Text("Jenis Kelamin : ${data?.jenisKelamin}"),
                                        // SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PageUpdatePegawai(data: data),
                                                        ),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.indigo,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  GestureDetector(
                                                    onTap: () {
                                                      deleteData(
                                                          int.parse(data!.id));
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.indigo,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          )

                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
