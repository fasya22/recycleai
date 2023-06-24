import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 74, 136, 46);
// const primary = Colosr(0xff7165E3);
const secondaryColor = Color.fromARGB(197, 111, 207, 102);
const itemColor = Color(0xffD9DBF8);
const bgColor = Color(0xffF3F4F8);

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}