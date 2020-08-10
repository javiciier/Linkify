import 'package:flutter/material.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/appLogo.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/keys.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/backgroundImage.dart';
import 'package:linkify/src/Views/LoginPages/Widgets/loginForm.dart';
import 'package:linkify/util/constants.dart';


class LoginPage extends StatelessWidget{
  // Keys para identificar unívocamente los botones
  static const Key iniciarSesionButtonKey = Key(Keys.iniciarSesionButtonKey);
  static const Key registrarseButtonKey = Key(Keys.registraseButtonKey);

  LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }



  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Constants.basePadding * 1.5),
          child: Column(
            children: <Widget>[
              _buildBackButton(context),
              Padding(
                padding: EdgeInsets.all(Constants.widgetsDefaultDistance * 2),
                child: Container(),
              ),
              _buildLogo(),
              Padding(
            padding: EdgeInsets.all(Constants.widgetsDefaultDistance),
            child: Container(),
          ),
              _buildLoginFormLayout(context),
            ],
          ),
        )
      ),
    );
  }


  Widget _buildBackButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(0xE5, 0x59, 0x34, 1)
                ),

                Text(
                  "Volver",
                  style: TextStyle(
                    color: Color.fromRGBO(0xE5, 0x59, 0x34, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            ),
            onTap: () => Navigator.of(context).pop(),
          )
        ),

      ],
    );
  }

  Widget _buildLoginFormLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildLoginForm(context)
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) => BackgroundImageWidget();

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppLogoWidget(),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      child: LoginFormWidget(),
    );
  }

}

