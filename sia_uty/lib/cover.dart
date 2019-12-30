import 'dart:convert';
import 'package:sia_uty/login.dart';
import 'package:sia_uty/navigasi.dart';
import 'package:sia_uty/home.dart';
import 'package:flutter/material.dart';
import "dart:async";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;


class CoverPage extends StatefulWidget {
  @override
  _CoverPageState createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Koneksi Gagal",
      desc: "Silahkan Cek Koneksi Anda",
    ).show();
  }



  String status='';
  SharedPreferences prefs;

  ambildata() async{
    await new Future.delayed(const Duration(seconds : 1));
    prefs = await SharedPreferences.getInstance();
    http.Response hasil = await http.get(
      Uri.encodeFull("http://api-sia.uty.ac.id/testing"), headers: {"Accept": "application/json","q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
    );

     if (this.mounted) {
      this.setState((){
        var data = jsonDecode(hasil.body);

          if(data['SIA_RestAPI']['status']==true){
            if(prefs.getString('NimSes')!=null) {
                Navigator.pushReplacement(context,
                  PageTransition(type: 
                PageTransitionType.downToUp, child: new MyHomePage()));
            }else{
                Navigator.pushReplacement(context,
                  PageTransition(type: 
                PageTransitionType.downToUp, child: new LoginPage()));
            }
          }else if(data['SIA_RestAPI']['status']==false){
            _onAlertButtonPressed(context);
          }else{
            _onAlertButtonPressed(context);
          }

      });
    }
    

  }
   void initState() {
    this.ambildata();
  }
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue[900],
                Colors.blue[800],
                Colors.blue[400]
              ]
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Image.asset('assets/logo-uty-png.png',width: 100.0,height: 100.0),
              SizedBox(height: 30.0,),
              CircularProgressIndicator(backgroundColor: Color.fromRGBO(255, 255, 255, 1),)
              ]
            ) 
          )
        ),
      );
    }
}