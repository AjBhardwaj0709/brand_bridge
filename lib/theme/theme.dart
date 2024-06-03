import 'package:flutter/material.dart';


class AppColors {
  static const Color primaryColor = Colors.red;
  static const Color accentColor = Colors.blue;

  // Define a static method to return the gradient
  static LinearGradient get gradientBackground {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(255, 4, 51, 90), Colors.blue], // Example colors
    );
  }
}

ThemeData lightMode= ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.grey,
  ),
  
);

ThemeData darkMode= ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
  )
);