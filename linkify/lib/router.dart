import 'package:flutter/material.dart';
import 'package:linkify/src/Views/LoginScreens/loginLandingPage.dart';
import 'package:linkify/src/Views/LoginScreens/loginPage.dart';


/// Clase encargada de enlazar las distintas rutas de la aplicación con sus respecivas vistas.
class Routes {
  static const String landingPage = '/';     // Pagina de bienvenida a la app
  static const String login = '/login';      // Página para iniciar sesión o registrarse
}


class Router {
  /// Recibe una ruta [route] y accede a ella
  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.landingPage:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginLandingPage());
      case Routes.login:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
      

      
      default:
        return null;
    }
  }
}