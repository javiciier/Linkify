import 'package:flutter/material.dart';

class LoginLandingPage extends StatelessWidget{
  static final double _buttonHeightScaleFactor = 0.06;
  static final double _buttonWidthScaleFactor = 0.80;

  LoginLandingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0Xf2, 0Xe5, 0Xd7, 1.0),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // _buildBackgroundImage(context),
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
        SizedBox(height: 20),
        _buildRegisterButton(context)
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * _buttonHeightScaleFactor,
      minWidth: MediaQuery.of(context).size.width * _buttonWidthScaleFactor,
      child: RaisedButton(
        child: Text(
          "Iniciar sesión",
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 20
          )
        ),
        color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
        elevation: 10,
        splashColor: Color.fromRGBO(0XBA, 0X3B, 0X18, 1),
        onPressed: () => print("INICIAR SESIÓN pulsado"),
      ),
    );
  }

    Widget _buildRegisterButton(BuildContext context) {
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * _buttonHeightScaleFactor,
      minWidth: MediaQuery.of(context).size.width * _buttonWidthScaleFactor,
      child: RaisedButton(
        child: Text("Registrarse",
        style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 20
          )
        ),
        textColor: Colors.white,
        color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
        elevation: 10,
        splashColor: Color.fromRGBO(0XBA, 0X3B, 0X18, 1),
        onPressed: () => print("REGISTRARSE pulsado"),
      ),
    );
  }




}

