import 'package:flutter/material.dart';


class LoginLandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0Xf2, 0Xe5, 0Xd7, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Linkify",
              style: TextStyle(color: Color.fromRGBO(0Xff, 0x09, 0x05, 1.0),
                              fontSize: 20,
                              ),
              textScaleFactor: 4,
            ),
            // TODO: Agregar botones de inicio de sesión y registrarse. Diseñar logo de linkify
          ],
        ),
      )
    );
  }
}