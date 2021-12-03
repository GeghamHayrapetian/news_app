import 'package:flutter/material.dart';

const String fontNameDefault = 'Lato';

const whiteColor = Color.fromRGBO(255, 255, 255, 1.0);
const blackColor = Color.fromRGBO(0, 0, 0, 1.0);
const alabasterColor = Color.fromRGBO(240, 240, 240, 1.0);
const codGrayColor = Color.fromRGBO(21, 21, 21, 1.0);
const silverColor = Color.fromRGBO(196, 196, 196, 1.0);
const carnationColor = Color.fromRGBO(251, 84, 84, 1.0);

TextStyle getStyle({FontWeight? weight, double? fontSize, Color? color}) {
  return TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: weight,
      fontSize: fontSize,
      color: color);
}
