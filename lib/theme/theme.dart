import 'package:flutter/material.dart';

class AppColors {
  // Define a static method to return the gradient
  static LinearGradient get gradientBackground {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // colors: [Color.fromARGB(255, 4, 51, 90), Colors.blue],
      colors: [
        Color(0xff09203f),
        Color(0xff537895),
      ], // Example colors
    );
  }
}

class ElementColor {
  // static Color get primaryColor {
  //   return const Color.fromARGB(255, 165, 236, 168);
  // }
  static const Color primaryColor= Color.fromRGBO(37, 211, 102, 1);
  static const Color textColor= Color(0xFFFFFFFF);
  
}
