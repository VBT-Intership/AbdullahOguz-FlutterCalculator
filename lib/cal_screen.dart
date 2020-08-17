import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  var text;

  CalculatorScreen({this.text});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${widget.text}",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white, fontSize: 55),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
