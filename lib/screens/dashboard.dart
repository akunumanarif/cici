import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                  icon: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png")),
                  onPressed: null),
            )
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: IconButton(
                  icon: Icon(Icons.graphic_eq),
                  onPressed: () => Navigator.of(context).pushNamed('/akun'),
                ),
              );
            },
          )),
      body: Column(),
    );
  }
}
