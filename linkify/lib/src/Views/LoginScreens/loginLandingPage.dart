import 'package:flutter/material.dart';
import 'package:linkify/src/Views/LoginScreens/Widgets/accessButton.dart';
import 'package:linkify/util/constants.dart';
import 'package:linkify/src/Views/LoginScreens/Widgets/keys.dart';
import 'package:linkify/src/Views/Routes/router.dart';

class LoginLandingPage extends StatelessWidget{
  static final double _buttonHeightScaleFactor = 0.06;
  static final double _buttonWidthScaleFactor = 0.80;

  // Keys para identificar unívocamente los botones
  static const Key iniciarSesionButtonKey = Key(Keys.iniciarSesionButtonKey);
  static const Key registrarseButtonKey = Key(Keys.registraseButtonKey);

  LoginLandingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(0Xf2, 0Xe5, 0Xd7, 1.0),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildBackgroundImage(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildIntroductionText(context),
                _buildButtons(context)
              ],
            )
          ],
        ),
      ),
    );
  }


  // ignore: unused_element
  Widget _buildBackgroundImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background-image.png"),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _buildLogo() {
    // TODO: Crear logotipo .png y mostrarlo aquí
    return Text(
      "Linkify",
      textScaleFactor: 4.5,
      style: TextStyle(
        color: Color.fromRGBO(0xFF, 0xC9, 0x05, 1),
        fontSize: 20
      )
    );
  }

  Widget _buildIntroductionText(BuildContext context) {
    return Text(
      "Tu gestor de enlaces favorito",
      textScaleFactor: 1.1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
        fontSize: 20
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildLoginButton(context),
        SizedBox(height: Constants.buttonsDistance),
        _buildRegisterButton(context)
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    String texto = "Iniciar sesión";
    return new AccessButton(
      key: iniciarSesionButtonKey,
      text: texto,
      textColor: Colors.white,
      buttonColor: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
      // onPressedCallback: () => print("Botón \"$texto\" pulsado")
      onPressedCallback: () => Navigator.of(context).pushNamed(Routes.login),
    );
  }

    Widget _buildRegisterButton(BuildContext context) {
      String texto = "Registrarse";
      return new AccessButton(
        key: iniciarSesionButtonKey,
        text: texto,
        textColor: Colors.white,
        buttonColor: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
        onPressedCallback: () => print("Botón \"$texto\" pulsado")  // TODO: Implementar pantalla Registrarse
      );
  }




}

