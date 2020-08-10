import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Linkify",
      textScaleFactor: 4.5,
      style: TextStyle(
        color: Color.fromRGBO(0xFF, 0xC9, 0x05, 1),
        fontSize: 20
      )
    );
  }
}