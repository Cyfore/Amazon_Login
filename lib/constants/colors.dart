import 'package:flutter/material.dart';

class MyColors {
  static const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
  static const Color fontGrey = Color.fromRGBO(107, 115, 119, 1);
  static const Color darkFontGrey = Color.fromRGBO(62, 68, 71, 1);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
  static const Color redColor = Color.fromRGBO(230, 46, 4, 1);
  static const Color golden = Color.fromRGBO(255, 168, 0, 1);
  static const Color brightTurquoise = Color.fromRGBO(48, 241, 217, 1);
  static const Color bostonBlue = Color.fromRGBO(46, 160, 183, 1);
  // LinearGradient
  static const LinearGradient appBarGradient = LinearGradient(colors: [
    bostonBlue,
    brightTurquoise,
  ]);

    static const appBarGradient2 = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
}
