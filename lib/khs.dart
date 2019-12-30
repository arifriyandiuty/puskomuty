// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KhsPage extends StatefulWidget {
  @override
  _KhsPageState createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  
  List dataJSON;
  SharedPreferences prefs;

   ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/khs"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    if (this.mounted) {
      this.setState((){
        var data = jsonDecode(hasil.body);
        dataJSON = data['SIA_RestAPI']['result']['KHS'];
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                child: Text('KHS Mahasiswa',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0)),
            ),
            SizedBox(height: 25.0),
            if(dataJSON == null)
            Container(
              padding: EdgeInsets.symmetric(vertical: 230.0),
              child: Center(
                child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
              ),
            )
            else
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dataJSON == null ? 0: dataJSON.length,
                      itemBuilder: (context, i){
                        return
                      Column(
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
                                        'Semester '+dataJSON[i]['smt']+' '+dataJSON[i]['ta'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Total SKS : '+dataJSON[i]['sks'],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        'Total Nilai : '+dataJSON[i]['total'],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        'IP Semester : '+dataJSON[i]['ips'],
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
                      );
                    }
                    )   
                  ],
                ),
              )
            ]
            )
          ],
        ),
      ),
    );
  }
}


