import 'package:flutter/material.dart';

class KalenderPage extends StatefulWidget {
  @override
  _KalenderPageState createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {
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
              child: Text('Kalender Akademik',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0)),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
              child: Text(
                'SEMESTER 1 (Ganjil) T.A. 2019/2020',
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
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Registrasi & Pengisian KRS Mahasiswa Lama',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '24 - 27 Juni 2019 & 23 - 28 Agustus 2019',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Pengarahan Akademik dan Pengisian KRS Mahasiswa Baru',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '09 - 14 September 2019 (07 September 2019, Pengambilan Jas, dll)',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Perkuliahan tahap 1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '16 September - 02 Nopember 2019 (7 minggu)',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Dies Natalies Universitas',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '23 Oktober 2019',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ujian Tengah Semester 1 (UTS 1)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '04-16 November 2019',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Upacara Wisuda',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '14 Desember 2019',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
              child: Text(
                'Semester 2 (Genap) T.A. 2019/2020',
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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Registrasi & Pengisian KRS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '22 - 25 Januari 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Perkuliahan tahap 1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '27 Januari - 14 Maret 2020 (7 minggu)',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ujian Tengah Semester 2 (UTS 2)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '16 - 28 Maret 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Perkuliahan tahap 2',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '30 Maret - 16 Mei 2020 (7 minggu)',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Upacara Wisuda',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '11 April 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ujian Akhir Semester 2 (UAS 2)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '08 - 20 Juni 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
              child: Text(
                'Semester Antara T.A. 2019/2020',
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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Pengisian KRS Semester Antara',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '24 - 27 Juni 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Perkuliahan Semester Antara',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '29 Juni - 15 Agustus 2020 (8 minggu) Termasuk UTS 1 kali',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ujian Semester Antara (USA)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '18 - 24 Agustus 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Yudisium Semester Antara',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '28 Agustus 2020',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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

