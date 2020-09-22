import 'package:cici/screens/akun.dart';
import 'package:cici/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:cici/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/akun': (BuildContext context) => new HalamanAkun(),
        '/dashboard': (BuildContext context) => new SliderUtama(),
        '/profil': (BuildContext context) => new HalamanProfil(),
      },
      title: "Cici Pet",
      home: HalamanProfil(),
      debugShowCheckedModeBanner: false,
    );
  }
}
