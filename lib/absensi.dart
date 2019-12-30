import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiPage extends StatefulWidget {
  @override
  _AbsensiPageState createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  List dataJSON;
  String kd='';
  String ta='';
  bool status=false;
  SharedPreferences prefs;


   ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/absensi"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    if (this.mounted) {
      this.setState((){
        var data = jsonDecode(hasil.body);
        // data=bro;
        if(data['SIA_RestAPI']['status']==true){
          status=true;
          dataJSON = data['SIA_RestAPI']['result']['absensi'];
          ta = data['SIA_RestAPI']['result']['ta'];
          kd = data['SIA_RestAPI']['result']['absensi'][0]['kd_mengajar'];
        }else{
          status = data['SIA_RestAPI']['status'];
          kd='false';
        }
      });
    }

  }

  

  @override
  void initState() {
    this.ambildata();
  }

  
  String namamk='';
  String sks='';
  String hari='';
  String jam='';
  String kode='';
  String pert1='';
  String pert2='';
  String pert3='';
  String pert4='';
  String pert5='';
  String pert6='';
  String pert7='';
  String pert8='';
  String pert9='';
  String pert10='';
  String pert11='';
  String pert12='';
  String pert13='';
  String pert14='';
  var pert;
  var no;

  ambildetail(String id) async{
    _onButtonElse();
      http.Response detail = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/absensi"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H","k":id}
    );
    var datadetail = jsonDecode(detail.body);
    if (this.mounted) {
    
      // idkd=datadetail['SIA_RestAPI']['result']['absensi']['kd_mengajar'];
      namamk=datadetail['SIA_RestAPI']['result']['absensi']['nama_mk'];
      sks=datadetail['SIA_RestAPI']['result']['absensi']['sks'];
      hari=datadetail['SIA_RestAPI']['result']['absensi']['hari'];
      jam=datadetail['SIA_RestAPI']['result']['absensi']['jam'];
      kode=datadetail['SIA_RestAPI']['result']['absensi']['kode'];

      pert1=datadetail['SIA_RestAPI']['result']['absensi']['pert1'];
      pert2=datadetail['SIA_RestAPI']['result']['absensi']['pert2'];
      pert3=datadetail['SIA_RestAPI']['result']['absensi']['pert3'];
      pert4=datadetail['SIA_RestAPI']['result']['absensi']['pert4'];
      pert5=datadetail['SIA_RestAPI']['result']['absensi']['pert5'];
      pert6=datadetail['SIA_RestAPI']['result']['absensi']['pert6'];
      pert7=datadetail['SIA_RestAPI']['result']['absensi']['pert7'];
      pert8=datadetail['SIA_RestAPI']['result']['absensi']['pert8'];
      pert9=datadetail['SIA_RestAPI']['result']['absensi']['pert9'];
      pert10=datadetail['SIA_RestAPI']['result']['absensi']['pert10'];
      pert11=datadetail['SIA_RestAPI']['result']['absensi']['pert11'];
      pert12=datadetail['SIA_RestAPI']['result']['absensi']['pert12'];
      pert13=datadetail['SIA_RestAPI']['result']['absensi']['pert13'];
      pert14=datadetail['SIA_RestAPI']['result']['absensi']['pert14'];

      pert=[pert1,pert2,pert3,pert4,pert5,pert6,pert7,pert8,pert9,pert10,pert11,pert12,pert13,pert14];
      no=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
      Navigator.pop(context);
      _onButtonPressed();
      
    }
  }

  


  void _onButtonPressed(){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 600.0,
            color: Color(0xFF737373),
            child : Container(
              child:  _isimodal() ,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ) 
              ),
            ),
          );
        },
        isScrollControlled: true,  
      );
    }


  void _onButtonElse(){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100.0,
          color: Color(0xFF737373),
          child : Container(
            child: _isikosong() ,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ) 
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  Container _isikosong(){
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        // child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
        child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
      ),
      
    );
  }

  Column _isimodal(){
    return Column(
        children: <Widget>[
          if(namamk=='')
          Container(
            padding: EdgeInsets.symmetric(vertical: 230.0),
            child: Center(
              // child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
              child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
            ),
            
          )
          else
          Column(
          children: <Widget>[
            Center(
              child : Icon(Icons.arrow_drop_down),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: Text(namamk,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
              child: Text('SKS : '+sks+', Kelas : A',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
              child: Text('Hari : '+hari+', Pukul : '+jam,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
              child: Text('Ruang : '+kode,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0)),
            ),
            SizedBox(height: 30.0,),
            for(var i=0; i<=10;i++)
            Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pertemuan '+no[i]+' : ',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 13.0,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        // ''+jml.toString(),
                        pert[i],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Divider(thickness: 1.0,),
                ),
              ]
            )
            )
          ]
          )
        
        ],
      );
  }

  // int angka=1;
  

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Text('Absensi Mahasiswa',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
              child: Text(
                ta,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
              child: Column(
                children: <Widget>[

                  if(kd=='')
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 70.0),
                    child: Center(
                      // child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
                      child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
                    ),
                    
                  )
                  else if(status==false)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 70.0),
                    child: Center(
                      // child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
                      child : Text(
                                "Data Absensi Tidak Ada..",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                    ),
                    
                  )
                  else
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataJSON == null ? 0: dataJSON.length,
                    itemBuilder: (context, i){
                      return
                      Padding(
                      padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        dataJSON[i]['nama_mk'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '(SKS : '+dataJSON[i]['sks']+', Kelas : A)',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        'Hari : '+dataJSON[i]['hari']+', Pukul : '+dataJSON[i]['jam'],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        'Ruang : '+dataJSON[i]['kode'],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        'Hadir : '+dataJSON[i]['hadir']+', Alpha : '+dataJSON[i]['alpa']+', Sakit: '+dataJSON[i]['sakit']+', Ijin : '+dataJSON[i]['ijin'],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                width: 90,
                                height: 30,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue[50]
                                ),
                                child: Center(
                                  child : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text("Rincian", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                        onPressed: () {
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (BuildContext context) => InformasiPage()
                                          // ));
                                          ambildetail(dataJSON[i]['kd_mengajar']);
                                          

                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.0),
                            child: Divider(),
                          ),
                        ]
                      )
                      );
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
   

  
}

