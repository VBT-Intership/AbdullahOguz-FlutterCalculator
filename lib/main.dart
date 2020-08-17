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
      opr = "";
      output = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      print(num1);
    }

    setState(() {
      text = buttonText;
    });
  }
}
