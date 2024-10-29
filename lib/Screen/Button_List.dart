import 'package:flutter/material.dart';
import 'package:microservice/Screen/List_Berita.dart';
import 'package:microservice/Screen/Pegawai/Login.dart';

class PageButtonList extends StatelessWidget {
  const PageButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageListBerita()));
              },
              color: Colors.green,
              textColor: Colors.white,
              child: const Text(
                'Berita',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const loginpegawaipage()));
              },
              color: Colors.green,
              textColor: Colors.white,
              child: const Text(
                'Pegawai',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
