import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles{
  static TextStyle titleBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: ColorManager.navy,
  );

  static TextStyle titleWhite = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle subtitleBlack = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ColorManager.navy,
  );

  static TextStyle subtextGrey = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: ColorManager.grey,
  );
}
