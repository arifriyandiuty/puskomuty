import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class ClickPerMonth {
  final String month;
  final double clicks;
  final charts.Color color;

  ClickPerMonth(this.month, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _DashboardPageState extends State<DashboardPage> {
  List dataJSON;
  int c;
  String k;
  SharedPreferences prefs;

   ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/khs"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H","g":"1"}
    );
    if (this.mounted) {
      this.setState((){
        var data = jsonDecode(hasil.body);
        dataJSON = data['SIA_RestAPI']['result']['KHS'];
        k = data['SIA_RestAPI']['result']['KHS'][0]['smt'];
        c =dataJSON.length;
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
    var chartWidget;
    if(k=='')
    var tes;
    else if(k!=''){
    var data = [
               
      ClickPerMonth('', 0, Colors.red),
                
    ];

    List<ClickPerMonth> tsdata= List();
    
      if (dataJSON != null) {
        for (Map m in dataJSON) {
          try {
          if(double.parse(m['ips'])>=3.0)
            tsdata.add(new ClickPerMonth(m['smt']+' '+m['ta'], double.parse(m['ips']), Colors.green[600]),);
          else if(double.parse(m['ips'])<3.0 && double.parse(m['ips'])>=2.0)
            tsdata.add(new ClickPerMonth(m['smt']+' '+m['ta'], double.parse(m['ips']), Colors.orange),);
          else if(double.parse(m['ips'])<2.0)
            tsdata.add(new ClickPerMonth(m['smt']+' '+m['ta'], double.parse(m['ips']), Colors.red),);

          } catch (e) {
            print(e.toString());
          }
        }
      }
  

    var series = [
      new charts.Series(
          id: 'Clicks',
          domainFn: (ClickPerMonth clickData, _) => clickData.month,
          measureFn: (ClickPerMonth clickData, _) => clickData.clicks,
          colorFn: (ClickPerMonth clickData, _) => clickData.color,
          data: k != '' ? tsdata: data,
          labelAccessorFn: (ClickPerMonth clickData, _) => '${clickData.month} : ${clickData.clicks.toString()}'
      )
    ];

    var chart = new charts.BarChart(
        series,
        vertical: false,
        animate: true, animationDuration: Duration(milliseconds: 1500),
        barRendererDecorator: charts.BarLabelDecorator<String>(),
        domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
        );

    chartWidget = Padding(
      padding: EdgeInsets.all(12.0),
      child: SizedBox(height: dataJSON != null ? c>5 ? 520 : 320 :0, child: chart),
    );

    }
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
            // Container(
            //   width: double.infinity,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         IconButton(
            //           icon: Icon(Icons.arrow_back),
            //           color: Colors.black54,
            //           iconSize: 30.0,
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Text('Grafik Nilai',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0)),
            ),
            if(k=='')
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 70.0),
                    child: Center(
                      // child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
                      child : CircularProgressIndicator(backgroundColor: Color.fromRGBO(77, 77, 255,1),valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)
                    ),
                    
                  )
            else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                width: double.infinity,
                height: dataJSON != null ? c>5 ? 570 : 370 :0,
                decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: <Color>[Colors.blue[400],Colors.blue[600],Colors.blue[800],Colors.blue[900]])),
                child: Column(
                  children: <Widget>[
                    // if(tsdata!=[])
                    chartWidget
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
              child: Text(
                'Daftar KHS',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25.0),
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
                                      'Tahun Ajaran : '+dataJSON[i]['ta'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Semester : '+dataJSON[i]['smt'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(100.0),
                                
                                color: double.parse(dataJSON[i]['ips'])>3.0 ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    dataJSON[i]['ips'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 25.0),
                              // Text(
                              //   dataJSON[i]['ips'],
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 18.0,
                              //       fontWeight: FontWeight.bold),
                              // )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(),
                        ),
                      ]
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


