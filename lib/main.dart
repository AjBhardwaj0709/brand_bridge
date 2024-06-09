import 'package:brand_bridge/pages/homePage.dart';
import 'package:brand_bridge/pages/login.dart';
import 'package:brand_bridge/pages/signUp.dart';
import 'package:brand_bridge/pages/splash_screen.dart';
// import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      routes: {
        '/LoginPage': (context) =>  const LoginPage(),
        '/Signup':(context)=>  const Signup(),
        '/home':(context) =>  const HomePage(),
      },
    );
  }
}
