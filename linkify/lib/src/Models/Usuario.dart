import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:linkify/util/constants.dart';

class Usuario {
  /// Clase que representa a un usuario de la aplicación
  // ignore: non_constant_identifier_names
  final String idUsuario;       // Identificador del usuario
  final String usuario;         // Nombre del usuario (username, nickname, apodo...)
  final String nombre;
  final String apellido1;
  final String apellido2;
  final String clave;
  final String email;
  final Image fotoPerfil;
  final DateTime fechaRegistro;

  // Constructor
  const Usuario({
    @required this.idUsuario,
    @required this.usuario,
    @required this.nombre,
    @required this.apellido1,
    @required this.apellido2,
    @required this.clave,
    @required this.email,
    @required this.fotoPerfil,
    @required this.fechaRegistro
  });


  // Constructor a partir de JSON
  factory Usuario.fromJSON(Map<String, dynamic> jsonData, String id) {
    if (jsonData == null) return null;

    final String usuario = jsonData['usuario'].toString();
    if (usuario == null) return null;

    final String nombre = jsonData['nombre'].toString();
    if (nombre == null) return null;

    final String apellido1 = jsonData['apellido1'].toString();
    if (apellido1 == null) return null;

    final String apellido2 = jsonData['apellido2'].toString();
    if (apellido2 == null) return null;

    // TODO: Cifrar contraseñas
    final String clave = jsonData['clave'].toString();
    if (clave == null) return null;

    final String email = jsonData['email'].toString();
    if (email == null) return null;

    // Obtiene la foto de perfil
    String fotoURL = jsonData['fotoPerfil'].toString();
    final Image fotoPerfil = Image.network(fotoURL);
    if (fotoPerfil == null) return null;

    // Obtiene la fecha de registro
    int fecha = jsonData['fechaRegistro'];
    DateTime fechaEnMS = DateTime.fromMillisecondsSinceEpoch(fecha);
    DateTime fechaRegistro = new DateFormat(Constants.dateFormat).format(fechaEnMS) as DateTime;
    if (fechaRegistro == null) return null;

    return new Usuario(
      idUsuario: id,
      usuario: usuario,
      nombre: nombre,
      apellido1: apellido1,
      apellido2: apellido2,
      clave: clave,
      email: email,
      fotoPerfil: fotoPerfil,
      fechaRegistro: fechaRegistro);
  }

  Map<String, dynamic> toJSON() {
      Map json = new Map<String, dynamic>();
      json['idUsuario']      = this.idUsuario;
      json['usuario']        = this.usuario;
      json['nombre']         = this.nombre;
      json['apellido1']      = this.apellido1;
      json['apellido2']      = this.apellido2;
      json['clave']          = this.clave;
      json['email']          = this.email;
      json['fotoPerfil']     = this.fotoPerfil.toString();
      json['fechaRegistro']  = this.fechaRegistro.toString();

      return json;
    }


  @override
  int get hashCode => hashValues(this.idUsuario, this.usuario, this.nombre, this.fechaRegistro);

  @override
  bool operator ==(Object other) {
    return (
      other is Usuario
      && other.idUsuario == this.idUsuario
      && other.usuario == this.usuario
      && other.nombre == this.nombre
      && other.fechaRegistro == this.fechaRegistro
    );
  }

  @override
  String toString() => "usuario: $usuario, nombre: $nombre, apellido1: $apellido1, apellido2: $apellido2";
}