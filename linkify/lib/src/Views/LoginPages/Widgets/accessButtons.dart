import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkify/util/constants.dart';

class AccessButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressedCallback;
  

  /// Constructor
  AccessButtonWidget({
    Key key,
    @required this.text,
    @required this.textColor,
    @required this.buttonColor,
    this.onPressedCallback,
  });


  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * Constants.buttonMaxHeighFactor,
      minWidth: MediaQuery.of(context).size.width * Constants.buttonMaxWidthFactor,
      child: RaisedButton(
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: Constants.buttonFontSize,
            fontFamily: Constants.buttonfontFamily,
            color: this.textColor
          ),
        ),
      color: this.buttonColor,
      onPressed: this.onPressedCallback,
      splashColor: Color.fromRGBO(0XBA, 0X3B, 0X18, 1),
      elevation: Constants.buttonElevation
      )
    );
  }

}