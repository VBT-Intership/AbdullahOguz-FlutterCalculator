import 'package:Calculator/color.dart';
import 'package:flutter/material.dart';
import 'package:Calculator/button.dart';

class Keyboard extends StatelessWidget {
  final CalculatorButtonCallback onTap;
  const Keyboard({
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedCalcButton(
                "C",
                onTap: onTap,
                color: softGray,
                zeroBtn: false,
                textColor: blackGray,
              ),
              RoundedCalcButton(
                '+/-',
                color: softGray,
                textColor: blackGray,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton('%',
                  color: softGray,
                  textColor: blackGray,
                  onTap: onTap,
                  zeroBtn: false),
              RoundedCalcButton(
                '÷',
                color: orange,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedCalcButton(
                '7',
                color: deepBlack,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '8',
                color: deepBlack,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '9',
                color: deepBlack,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                'x',
                color: orange,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedCalcButton(
                '6',
                color: blackGray,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '5',
                color: blackGray,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '4',
                color: blackGray,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '-',
                color: orange,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedCalcButton(
                '1',
                color: blackGray,
                textColor: softWhite,
                zeroBtn: false,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '2',
                color: blackGray,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
              RoundedCalcButton(
                '3',
                color: blackGray,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
              RoundedCalcButton(
                '+',
                color: orange,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedCalcButton(
                '0',
                color: deepBlack,
                textColor: softWhite,
                zeroBtn: true,
                onTap: onTap,
              ),
              RoundedCalcButton(
                '.',
                color: deepBlack,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
              RoundedCalcButton(
                '=',
                color: orange,
                textColor: softWhite,
                onTap: onTap,
                zeroBtn: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
