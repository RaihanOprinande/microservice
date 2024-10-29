import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:microservice/Model/UpdatePegawai_Model.dart';
import 'package:microservice/Screen/Pegawai/List.dart';

import '../../Model/ListPegawai_Model.dart';


class PageUpdatePegawai extends StatefulWidget {
  final Datum? data;
  const PageUpdatePegawai({super.key, this.data});

  @override
  State<PageUpdatePegawai> createState() => _PageUpdatePegawaiState();
}

class _PageUpdatePegawaiState extends State<PageUpdatePegawai> {
  TextEditingController txtNama_pegawai = TextEditingController();
  TextEditingController txtNo_hp = TextEditingController();
  TextEditingController txtalamat = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtTgl_lahir = TextEditingController();
  TextEditingController txtjenis_kelamin = TextEditingController();

  GlobalKey<FormState> keyForm= GlobalKey<FormState>();

  //proses untuk hit api
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    txtNama_pegawai.text = widget.data!.namaPegawai;
    txtNo_hp.text = widget.data!.noHp;
    txtalamat.text = widget.data!.alamat;
    txtemail.text = widget.data!.email;
    txtTgl_lahir.text = widget.data!.tglLahir;
    txtjenis_kelamin.text = widget.data!.jenisKelamin;
  }

  Future<UpdatepegawaiModel?> editData() async {
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(
        Uri.parse('http://172.21.240.1:7070/pegawai/editpegawai.php'),
        body: {
          "id": widget.data!.id.toString(),
          "nama_pegawai": txtNama_pegawai.text,
          "no_hp": txtNo_hp.text,
          "email": txtemail.text,
          "alamat": txtalamat.text,
          "tgl_lahir": txtTgl_lahir.text,
          "jenis_kelamin": txtjenis_kelamin.text,
        },
      );

      // Debugging: Print the response body
      print('Response Body: ${response.body}');

      // Check if the response status code is 200
      if (response.statusCode == 200) {
        UpdatepegawaiModel data = updatepegawaiModelFromJson(response.body);

        // Check the value of data
        if (data.value == 1) {
          setState(() {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${data.message}')));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PageListPegawai()),
                    (route) => false);
          });
        } else {
          setState(() {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${data.message}')));
          });
        }
      } else {
        // Handle server errors
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Server error: ${response.statusCode}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')));
      });
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.orange,
        title: Text('Edit Mahasiswa Form'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtNama_pegawai,
                  decoration: InputDecoration(
                      hintText: 'Nama pegawai',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtNo_hp,
                  decoration: InputDecoration(
                      hintText: 'Nomor handphone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtalamat,
                  decoration: InputDecoration(
                      hintText: 'Alamat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtemail,
                  //biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtTgl_lahir,
                  //biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Tanggal lahir',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtjenis_kelamin,
                  //biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Tanggal lahir',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   value: selectedAgama,
                //   items: <String>['Islam', 'Hindu', 'Budha', 'Kristen']
                //       .map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   hint: Text('Pilih Agama'),
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectedAgama = newValue;
                //     });
                //   },
                //   validator: (value) {
                //     return value == null ? "tidak boleh kosong " : null;
                //   },
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15,),
                Center( child: isLoading ? Center(
                  child: CircularProgressIndicator(),
                ) : MaterialButton(onPressed: (){

                  //cek validasi form ada kosong atau tidak
                  if(keyForm.currentState?.validate() == true){
                    setState(() {
                      editData();
                    });
                  }

                },
                  child: Text('Edit'),
                  color: Colors.green,
                  textColor: Colors.white,
                )
                )],
            ),
          ),
        ),
      ),
    );
  }
}
