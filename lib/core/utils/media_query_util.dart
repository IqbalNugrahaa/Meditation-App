import 'package:flutter/material.dart';

class ScreenSize {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double width75(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.75;

  static double width60(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.60;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
