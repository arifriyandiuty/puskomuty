// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nim='';
  String nama='';
  String prodi='';
  String ttl='';
  String agama='';
  String telp='';
  String sklh='';
  String email='';
  String foto='';
  // String nimses='';

  // Future<SharedPreferences> _panggil() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final namases='NimSes';
  //   nimses = prefs.getString(namases);
    
  // }
    SharedPreferences prefs;

    ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    // nimses = prefs.getString(namases);

    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/profil"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    if (this.mounted) {
    this.setState((){
      var data=jsonDecode(hasil.body);
      // dataJSON = data['data'];
      nim = data['SIA_RestAPI']['result']['profile']['nim'];
      nama = data['SIA_RestAPI']['result']['profile']['nama_lengkap'];
      prodi = data['SIA_RestAPI']['result']['profile']['jurusan'];
      ttl = data['SIA_RestAPI']['result']['profile']['ttl'];
      agama = data['SIA_RestAPI']['result']['profile']['agama'];
      telp = data['SIA_RestAPI']['result']['profile']['telepon'];
      sklh = data['SIA_RestAPI']['result']['profile']['sekolah'];
      email = data['SIA_RestAPI']['result']['profile']['email'];
      foto = data['SIA_RestAPI']['result']['profile']['foto'];
    });
    }

  }
  @override
  void initState() {
    // _panggil();
    this.ambildata();
  }




  Color primaryColor = Color.fromRGBO(255, 82, 48, 1);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        //leading: new Icon(Icons.local_grocery_store),
        title: new Text("SIKADU UTY",style: new TextStyle(color: Colors.white,fontSize: 15.0),),
    
        actions: <Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0)
            // child : new Icon(Icons.notifications,color: Colors.white,)
          ),
        ],
      ),
      body: SingleChildScrollView(
        
        padding: EdgeInsets.only(top: 20.0, right: 25.0, left: 25.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(nim=='')
            Container(
              padding: EdgeInsets.symmetric(vertical: 230.0),
              child: Center(

                child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
              ),
            )
            else
        Container(
        width: double.infinity,
        // height: 750.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: <Color>[Colors.blue[200],Colors.blue[100],Colors.blue[50],Colors.white]),
            // color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.withOpacity(1.0),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 15.0)
            ]),
        child :
            Column(
            children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Text('Profil Mahasiswa',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0)),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              // child: Image.asset(dataJSON[i]['SIA_RestAPI']['result']['profil']['foto'],width: 130.0,height: 200.0),
              child: Image(image: NetworkImage(foto),width: 130.0,height: 200.0),
              
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
              child: Text(
                'Data Diri',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 25.0, bottom: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nim Mahasiswa :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                nim,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nama Mahasiswa :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                nama,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Program Studi :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                prodi,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Tempat, Tanggal Lahir :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                ttl,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Agama :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                agama,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nomor Telepon :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                telp,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sekolah Asal :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                sklh,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Email :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0),
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ]
            )
          ),
        ],
      ),
      ),
    );
  }
}


