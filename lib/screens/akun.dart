import 'package:flutter/material.dart';

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          menu(context),
        ],
      ),
    );
  }
}

Widget menu(context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "Pet\'s",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "FAQ",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    ),
  );
}
