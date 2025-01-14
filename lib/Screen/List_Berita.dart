import 'package:microservice/Model/Berita_Model.dart';
import 'package:microservice/Screen/Detail_Berita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageListBerita extends StatefulWidget {
  const PageListBerita({super.key});

  @override
  State<PageListBerita> createState() => _PageListBeritaState();
}

class _PageListBeritaState extends State<PageListBerita> {

  Future<List<Datum>?> getData() async{
    try{

      http.Response res = await http.get(Uri.parse
        ('http://192.168.244.109:7070/getinfowisata.php'));
      return beritaModelFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Berita',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index){
                Datum? data = snapshot.data?[index];
                return Padding(padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      // untuk detail page
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => PageDetailBerita(listberita: data!)
                      ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image.network('http://192.168.1.3:8080/server_university/images/${data?.univImage}',
                            //   height: 35,
                            //   fit: BoxFit.fill,
                            // ),
                            Divider(),
                            Text('${data?.judulInfo}', style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),),
                            Text('${data?.tglInfo}', style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return const Center(
                child: CircularProgressIndicator(color: Colors.purple,)
            );
          }
        },
      ),
    );
  }
}