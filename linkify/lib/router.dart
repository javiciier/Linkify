import 'package:flutter/material.dart';
import 'package:linkify/src/Views/LoginScreens/LoginPage.dart';


/// Clase encargada de enlazar las distintas rutas de la aplicación con sus respecivas vistas.
class Router {
  static const String login = '/';     // Pagina de inicio de sesión

  Router();

  static Route<dynamic> generateRoute(RouteSettings route) {
    /* switch (route.name) {
      case login: */
        return MaterialPageRoute(builder: (_) => LoginLandingPage());
    /* } */
  }
}