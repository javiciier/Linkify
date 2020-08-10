import 'package:flutter/material.dart';
import 'package:linkify/util/constants.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/keys.dart';
import 'package:linkify/src/Views/Routes/router.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/backgroundImage.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/appLogo.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/accessButtons.dart';



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
      body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context) {
    return Container(
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
              _buildWelcomeText(context),
              _buildButtons(context)
            ],
          )
        ],
      ),
    );
  }


  Widget _buildBackgroundImage(BuildContext context) => BackgroundImageWidget();

  Widget _buildLogo() => AppLogoWidget();

  Widget _buildWelcomeText(BuildContext context) {
    String texto = "Tu gestor de enlaces favorito";
    return Text(
      texto,
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
    return new AccessButtonWidget(
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
      return new AccessButtonWidget(
        key: iniciarSesionButtonKey,
        text: texto,
        textColor: Colors.white,
        buttonColor: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
        onPressedCallback: () => print("Botón \"$texto\" pulsado")  // TODO: Implementar pantalla Registrarse
      );
  }




}

