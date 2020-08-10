import 'package:flutter/material.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/accessButtons.dart';
import 'package:linkify/util/constants.dart';
import 'package:linkify/util/loginValidators.dart';

/// Clase que devuelve un widget con los campos para inicair sesión en la app
class LoginFormWidget extends StatefulWidget{
  @override
  _MyLoginFormWidget createState() => _MyLoginFormWidget();
}

class _MyLoginFormWidget extends State<LoginFormWidget> {
  final _formGlobalKey = GlobalKey<FormState>();            // Clave para identificar el formulario
  final _emailTextController = TextEditingController();     // Controlador para el email del usuario
  final _passwordTextController = TextEditingController();  // Controlador para la contraseña del usuario

  // ESTADOS A GESTIONAR (valores que debe almacenar la pantalla)
  String email, clave;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formGlobalKey,
      child: _buildLoginForm(context),
    );
  }


  /// Genera un contenedor con la estructura del formulario
  Widget _buildLoginForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // _showFieldName(context, "Email"),
        _buildEmailInputTextField(context, "Email", _emailTextController),
        SizedBox(height: Constants.widgetsDefaultDistance),
        _buildPasswordInputTextField(context, "Contraseña", _passwordTextController),
        SizedBox(height: Constants.widgetsDefaultDistance * 2),
        _loginButton(context)
      ],
    );
  }


  /* Widgets que muestran los campos de texto y su información */


  Widget _buildEmailInputTextField(BuildContext context, String fieldName, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (email) => _userMailValidator(email),
      decoration: InputDecoration(
        labelText: fieldName,
        labelStyle: TextStyle(
          color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
          fontSize: 20
        ),
      ),
    );
  }

    Widget _buildPasswordInputTextField(BuildContext context, String fieldName, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (password) => _userPasswordValidator(password),
      obscureText: true,   // Oculta la contraseña
      decoration: InputDecoration(
        labelText: fieldName,
        labelStyle: TextStyle(
          color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return AccessButtonWidget(
      text: "Acceder",
      textColor: Colors.white,
      buttonColor: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
      onPressedCallback: () {
        print("Email: ${_emailTextController.text}");
        print("Email: ${_passwordTextController.text}");
      },
    );
  }



  /* Validadores de datos */
  String _userMailValidator(String email) {
    if (email.isEmpty) {
      return 'No ha introducido ningún correo';
    }
  }

  String _userPasswordValidator(String pass) {
    if (pass.isEmpty) {
      return 'No ha introducido ninguna contraseña';
    }
  }


  /* liberar recursos */
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

}