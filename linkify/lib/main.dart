import 'package:flutter/material.dart';
import 'package:linkify/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,    // Cuando se genera una ruta nueva se llama a esta función
      initialRoute: Router.login,              // Ruta inicial por defecto
      debugShowCheckedModeBanner: false,
    );
  }
}
