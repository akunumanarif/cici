import 'package:cici/screens/akun.dart';
import 'package:cici/screens/dashboard.dart';
import 'package:flutter/material.dart';

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
      },
      title: "Cici Pet",
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
