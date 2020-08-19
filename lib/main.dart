import 'dart:ffi';

import 'package:Calculator/button.dart';
import 'package:Calculator/cal_screen.dart';
import 'package:Calculator/color.dart';
import 'package:Calculator/keyboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = "";
  String firstNum = "";
  String secondNum = "";
  String preNumber = "";
  String _screenStep = "";
  double num1 = 0;
  double num2 = 0;
  var opr = "";
  bool next = false;
  double output = 0;

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
    if (validationOperator(buttonText)) {
      if (next) {
        secondNum = firstNum;

        if (buttonText == "=") {
          output = calculate(num1.toString(), opr, secondNum);
          _screenStep = output.toString();
        }
        firstNum = "";
      } else {
        print(firstNum);
        num1 = double.parse(firstNum);

        opr = buttonText;
        firstNum = "";
        next = true;
      }

      firstNum = "";
    } else if (!validationOperator(buttonText)) {
      //sadece sayıları ekranda gösterir.
      firstNum += buttonText;
      _screenStep = firstNum;

      if (buttonText == "C") {
        buttonText = "0";
        num1 = 0;
        num2 = 0;
        firstNum = "";
        _screenStep = "0";
        secondNum = "";
        output = 0;
        next = false;
        opr = "";
      }
    }

    setState(() {
      text = _screenStep;
    });
  }

  bool validationOperator(String value) {
    String pattern = r'^(?=.*?[=÷+-/x])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  double calculate(String firstNum, String opr, String secondNum) {
    num1 = double.parse(firstNum);
    num2 = double.parse(secondNum);
    if (opr == "+") {
      return sum(num1, num2);
    } else if (opr == "-") {
      return sub(num1, num2);
    } else if (opr == "x") {
      return multi(num1, num2);
    } else if (opr == "÷") {
      return divide(num1, num2);
    }
  }

  double sum(double num1, double num2) => num1 + num2;

  double sub(double num1, double num2) => num1 - num2;

  double multi(double num1, double num2) => num1 * num2;

  double divide(double num1, double num2) {
    if (num2 == 0) {
      debugPrint("hatalı işlem");
      return null;
    } else {
      return num1 / num2;
    }
  }
}

extension ToDouble on String {
  double toDouble() {
    return double.parse(this);
  }
}
