import 'package:flutter/material.dart';

typedef void CalculatorButtonCallback({String buttonText});

class RoundedCalcButton extends StatelessWidget {
  String btnText;
  Color color;
  Color textColor;
  bool zeroBtn;
  final CalculatorButtonCallback onTap;

  RoundedCalcButton(this.btnText,
      {this.color, this.textColor, this.zeroBtn, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        padding: zeroBtn
            ? EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20)
            : EdgeInsets.all(18),
        color: color,
        onPressed: () => onTap(buttonText: btnText),
        child: Text(btnText, style: TextStyle(fontSize: 35, color: textColor)),
        shape: zeroBtn ? StadiumBorder() : CircleBorder(),
      ),
    );
  }
}
