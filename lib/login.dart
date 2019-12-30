import 'package:sia_uty/Animation/FadeAnimation.dart';
import 'package:sia_uty/navigasi.dart';
import 'package:sia_uty/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
String alert='';
 _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Login Gagal",
      desc: alert,
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




TextEditingController nimlogin=new TextEditingController();
TextEditingController passlogin=new TextEditingController();


 _login() async {
  http.Response response = await http.get(
    Uri.encodeFull("http://api-sia.uty.ac.id/login"), headers: {"Accept": "application/json","u":nimlogin.text,"p": passlogin.text,"q":"SF27xMjAL178GOUgDoQ1GzL6v4jGk99H"}
  );
   if (this.mounted) {

      var datalogin = jsonDecode(response.body);
      // SharedPreferences prefs = await SharedPreferences.getInstance();


      if(datalogin['SIA_RestAPI']['status']==false){
        this.setState(() {
          alert=datalogin['SIA_RestAPI']['error'];
          _onAlertButtonPressed(context);
          passlogin.text='';
          nimlogin.text='';
        });
      }else if(datalogin['SIA_RestAPI']['status']==true){
          _berhasillogin();
      }
   }

  // return datalogin;
}
SharedPreferences prefs;
_berhasillogin() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("NimSes", nimlogin.text);
      if(prefs.getString('NimSes')==nimlogin.text){
        Navigator.pushReplacement(context,
          PageTransition(type: 
        PageTransitionType.downToUp, child: new MyHomePage()));
      }
    });
  }

  @override
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 42,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                  padding: EdgeInsets.all(0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset('assets/logo-uty-png.png',width: 70.0,height: 70.0),
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.3, Text("Sistem Informasi Akademik Terpadu", style: TextStyle(color: Colors.white, fontSize: 15),)),
                        FadeAnimation(1.3, Text("Universitas Teknologi Yogyakarta", style: TextStyle(color: Colors.white, fontSize: 17),)),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60),)
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1, Text("Silahkan Masuk", style: TextStyle(color: Colors.black54, fontSize: 15),)),
                        SizedBox(height: 10,),
                      SizedBox(height: 20,),
                      FadeAnimation(1.4, Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(0, 0, 255, .2),
                            blurRadius: 20,
                            offset: Offset(0, 10)
                          )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 50.0,right: 30.0,bottom: 10.0,top: 10.0),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "NIM",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                                controller: nimlogin,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 50.0,right: 30.0,bottom: 10.0,top: 10.0),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                                controller: passlogin,
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            _login();
                          },
                        child : FadeAnimation(1.6, Container(
                          width: 130,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange[900]
                          ),
                          child: Center(
                            child : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  // padding: EdgeInsets.only(right: 20.0,left: 20.0),
                                  child: Text("Masuk", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  // onPressed: () {
                                  //   _login();
                                  // },
                                ),
                              ],
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}