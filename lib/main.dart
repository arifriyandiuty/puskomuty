import 'package:flutter/material.dart';
import 'package:sia_uty/cover.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIA UTY Mobile',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: new CoverPage(),
      
    );
  }
}

// Future<void> main() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var token = prefs.getString('token');
//   print(token);

//   runApp(MaterialApp(home: token == null ? Login() : Home()));
// }

