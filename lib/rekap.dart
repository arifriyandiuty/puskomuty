// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RekapPage extends StatefulWidget {
  @override
  _RekapPageState createState() => _RekapPageState();
}

class _RekapPageState extends State<RekapPage> {
  String totalsks='';
  String totalnilai='';
  String ipk='';
  // int a=0;
  // int b=0;
  // int c=0;
  // int d=0;
  // int e=0;
  // int tat=0;
  // int tbt=0;
  // int tct=0;
  // int tdt=0;
  // int tet=0;
  // int jml=0;
  List dataJSON;
  SharedPreferences prefs;

   ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/rekap"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    if (this.mounted) {
      this.setState((){
        var data = jsonDecode(hasil.body);
        // data=bro;
        dataJSON = data['SIA_RestAPI']['result']['khs'];
        // jml=dataJSON.length;
        totalsks=data['SIA_RestAPI']['result']['khs'][0]['jumsks'];
        totalnilai=data['SIA_RestAPI']['result']['khs'][0]['jumbobot'];
        ipk=data['SIA_RestAPI']['result']['khs'][0]['ipk'];
      });
    }

  }


  @override
  void initState() {
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Text('Rekap Mahasiswa',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)),
            ),
            if(ipk=='')
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
            Padding(
              padding: EdgeInsets.only(top: 0.0, right: 25.0, left: 25.0, bottom: 20.0),
              
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  
                    // for (int i = 0; i < 6; i++)
                   
                    ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataJSON == null ? 0: dataJSON.length,
                    itemBuilder: (context, i){
                      // if(dataJSON[i]['nilai']=='A'){
                      // a=a+1;
                      // // tat=tat+4;
                      // }
                      // else if(dataJSON[i]['nilai']=='B'){
                      // b=b+1;
                      // // bt=bt+int.parse(dataJSON[i]['tot_bobot']);
                      // }
                      // else if(dataJSON[i]['nilai']=='C'){
                      // c=c+1;
                      // // ct=ct+int.parse(dataJSON[i]['tot_bobot']);
                      // }
                      // else if(dataJSON[i]['nilai']=='D'){
                      // d=d+1;
                      // // dt=dt+int.parse(dataJSON[i]['tot_bobot']);
                      // }
                      // else if(dataJSON[i]['nilai']=='E'){
                      // e=e+1;
                      // // et=et+int.parse(dataJSON[i]['tot_bobot']);
                      // }

                      return
                    Column(
                      children: <Widget>[
                        
                        Padding(
                          padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      dataJSON[i]['nama_mk'],
                                      // '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '(SKS : '+dataJSON[i]['sks']+', Kelas : '+dataJSON[i]['kelas']+')',
                                      // '',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      // '',
                                      'UTS : '+dataJSON[i]['uts'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      // '',
                                      'Total Nilai : '+dataJSON[i]['tot_bobot'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                // ''+jml.toString(),
                                dataJSON[i]['nilai'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
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
                    );
                    
                    }
                    ),

                    //batas looping data
               



                  // if(a.toString()!='0')
                  // Padding(
                  //   padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text(
                  //               'A : '+a.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 15.0,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'B : '+b.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 15.0,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'C : '+c.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 15.0,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'D : '+d.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 15.0,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'E : '+e.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 15.0,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  if(totalsks!='')
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total SKS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          totalsks,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  if(totalnilai!='')
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total Nilai',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          totalnilai,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  if(ipk!='')
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'IPK',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ipk,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0,),
                ],
              ),
            ),
            ]
            )
          ],
        ),
      ),
    );
  }
}


