import 'dart:ffi';

import 'package:logger/logger.dart';
import 'package:Calculator/button.dart';
import 'package:Calculator/cal_screen.dart';
import 'package:Calculator/color.dart';
import 'package:Calculator/keyboard.dart';
import 'package:flutter/material.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = "";
  String firstNum = "";
  String _screenStep = "";
  double num1 = 0;
  double num2 = 0;
  var opr = "";
  String output = '';
  String _output = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              child: Column(
                children: [
                  Flexible(
                    child: CalculatorScreen(
                      text: text,
                    ),
                    flex: 3,
                  ),
                  Flexible(
                    child: Keyboard(
                      onTap: onpress,
                    ),
                    flex: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void onpress({String buttonText}) {
    if (buttonText == "C") {
      buttonText = "0";
      num1 = 0;
      num2 = 0;
      _screenStep = "";
      opr = "";
      output = "";
    } else if (validationOperator(buttonText)) {
      _screenStep = buttonText;
      num1 = firstNum.toDouble();
      logger.v(num1);
      firstNum = "";
    } else if (!validationOperator(buttonText)) {
      //sadece sayıları ekranda gösterir.
      firstNum += buttonText;
      _screenStep = firstNum;
    }

    setState(() {
      text = _screenStep;
    });
  }

  bool validationOperator(String value) {
    String pattern = r'^(?=.*?[+-/x])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

extension ToDouble on String {
  double toDouble() {
    return double.parse(this);
  }
}
