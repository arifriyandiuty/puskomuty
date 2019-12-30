import 'package:flutter/material.dart';
import 'package:sia_uty/dashboard.dart';
import 'package:sia_uty/informasi.dart';
// import 'package:sia_uty/navigasi.dart';
import 'package:sia_uty/kalender.dart';
import 'package:sia_uty/khs.dart';
import 'package:sia_uty/rekap.dart';
import 'package:sia_uty/absensi.dart';
import 'package:sia_uty/profil.dart';
import 'package:sia_uty/login.dart';
import 'package:sia_uty/navigasi.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


   _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Pengembangan",
      desc: "Sedang Dalam Pengembangan",
      buttons: [
        DialogButton(
          color: Color.fromRGBO(0, 0, 255, 1),
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
   _onAlertkeluar(context){
    Alert(
      context: context,
      type: AlertType.info,
      title: "",
      desc: "Anda Yakin Ingin Keluar",
      buttons: [
        DialogButton(
          color: Color.fromRGBO(0, 181, 26, 1),
          child: Text(
            "Ya",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.clear();
            Navigator.pop(context);
            Navigator.pushReplacement(context,
              PageTransition(type: 
            PageTransitionType.downToUp, child: new LoginPage()));

          },
          width: 120,
        ),
        DialogButton(
          color: Color.fromRGBO(179, 27, 0, 1),
          child: Text(
            "Tidak",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        ),
      ],
    ).show();
  }

  

  String nim='';
  String nama='';
  String prodi='';
  String foto='';
  List dataJSON;
  SharedPreferences prefs;

   ambildata() async{
    prefs = await SharedPreferences.getInstance();
    
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/profil"), headers: {"Accept": "application/json","nim":prefs.getString('NimSes'),"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    http.Response info = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/info"), headers: {"Accept": "application/json","l":"5","q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );
    if (this.mounted) {
    this.setState((){
      var data=jsonDecode(hasil.body);
      nim = data['SIA_RestAPI']['result']['profile']['nim'];
      nama = data['SIA_RestAPI']['result']['profile']['nama_lengkap'];
      prodi = data['SIA_RestAPI']['result']['profile']['jurusan'];
      foto = data['SIA_RestAPI']['result']['profile']['foto'];

      var informasi=jsonDecode(info.body);
      dataJSON = informasi['SIA_RestAPI']['result']['info'];
      // nama = informasi['SIA_RestAPI']['result']['info'][0]['jurusan'];
    });
    }

  }

  @override
  void initState() {
    this.ambildata();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: new Text("SIKADU UTY",style: new TextStyle(color: Colors.white,fontSize: 15.0),),
        actions: <Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.notifications,color: Colors.white),
                  // onPressed: (){
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => DashboardPage()
                  //   ));
                  // },
                  onPressed: () => _onAlertButtonPressed(context),
                ),
                 Theme(
                  data: Theme.of(context).copyWith(
                    cardColor: Colors.blue[800],
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                  child: ListTileTheme(
                  iconColor: Color.fromRGBO(255, 255, 255, 1),
                    child : PopupMenuButton(
                      offset: Offset(0, 55),
                      elevation: 10,
                      onSelected: (val){
                        if(val=='keluar'){
                          _onAlertkeluar(context);
                        }
                      },
                      itemBuilder: (BuildContext context){
                        return [
                          PopupMenuItem(
                            value: 'pengaturan',
                            child: ListTile(
                              leading: Icon(Icons.settings,color: Color.fromRGBO(255, 255, 255, 1)),
                              title: Text('Pengaturan', 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0),),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'keluar',
                            child: ListTile(
                              leading: Icon(Icons.power_settings_new,color: Color.fromRGBO(255, 255, 255, 1)),
                              title: Text('Keluar', 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0),),
                            ),
                          ),
                        ];
                      },
                    )
                  )
                 )
              ],
            )
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 300.0,
                    decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: <Color>[Colors.blue[100],Colors.blue[200],Colors.blue[400],Colors.blue[600],Colors.blue[800],Colors.blue[900]])),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sistem Informasi Akademik Terpadu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(height: 15.0),
                          Text(
                            'Universitas Teknologi Yogyakarta',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset('assets/logo-uty-png.png',width: 50.0,height: 50.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 350.0,
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: <Color>[Colors.blue[50],Colors.white,Colors.blue[50],Colors.white,Colors.blue[50],Colors.white,Colors.blue[50],Colors.white,Colors.blue[50],Colors.white,Colors.blue[50],Colors.white]),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.withOpacity(1.0),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15.0),
                        if(foto=='')
                        Container(
                          padding: new EdgeInsets.all(13.0),
                          child: Center(
                            child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
                          ),
                        )
                        else if(foto!='')
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => ProfilPage()
                                    ));
                                },
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2.0),
                                  child: Image(image: NetworkImage(foto),width: 50.0,height: 50.0),
                                  
                                ),
                                SizedBox(width: 10.0,),
                                Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Text(
                                          nim,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12.0),
                                        ),
                                        Text(
                                          nama,
                                          style:
                                              TextStyle(color: Colors.blue, fontSize: 12.0),
                                        ),
                                        Text(
                                          prodi,
                                          style:
                                              TextStyle(color: Colors.blue, fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        else
                        Container(
                          padding: new EdgeInsets.all(13.0),
                          child: Center(
                            child: Text('Sedang Memuat...',style:TextStyle(color: Colors.black54, fontSize: 12.0),),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.calendar_today),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => KalenderPage()
                                        ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Kalender',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.format_list_numbered_rtl),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => KhsPage()
                                        ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('KHS',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.book),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => RekapPage()
                                        ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Rekap Nilai',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.input),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      // onPressed: () {
                                      //   openAlertBox();
                                      // },
                                      onPressed: () => _onAlertButtonPressed(context),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('KRS',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.playlist_add_check),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => AbsensiPage()
                                        ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Absensi',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.insert_chart),
                                      color: Colors.blue,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => DashboardPage()
                                        ));
                                        // Navigator.push(context,
                                        //       PageTransition(type: 
                                        // PageTransitionType.downToUp, child: DashboardPage()));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Grafik Nilai',
                                      style: TextStyle(
                                          color: Colors.blue,fontSize: 12.0))
                                ],
                              )
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),   
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Informasi',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,fontWeight: FontWeight.bold),
                  ),
                  Container(
                  width: 130,
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
                          child: Text("Selengkapnya", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => InformasiPage()
                            ));
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
              padding: EdgeInsets.only(left: 10.0, bottom: 25.0),
              child: Container(
                height: 120.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataJSON == null ? 0: dataJSON.length,
                    itemBuilder: (context, i){
                      return
                      Container(
                      width: 300,
                      child: GradientCard(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: <Color>[Colors.orange[200],Colors.orange[400],Colors.orange[600],Colors.orange[800],Colors.orange[900]]),
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(height: 7.0,),
                            ListTile(
                              title: Text(dataJSON[i]['judul'], style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              subtitle: Text(dataJSON[i]['isi'], style: TextStyle(color: Colors.white,fontSize: 12.0)),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                )
              ),
            )
          ],
        ),
        
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
