import 'package:flutter/material.dart';

final Color warnaLatar = Color(0xFF4A4A58);

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaLatar,
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
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Pet\'s",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "FAQ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
