import 'package:flutter/material.dart';
import 'package:linkify/src/Views/Routes/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linkify',
      onGenerateRoute: Router.generateRoute,    // Cuando se genera una ruta nueva se llama a esta función
      initialRoute: Routes.landingPage,              // Ruta inicial por defecto
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(0xD6, 0xAE, 0x82, 1),
        fontFamily: 'Roboto'
      )
    );
  }

  
}
