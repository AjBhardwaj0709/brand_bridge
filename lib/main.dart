// import 'package:brand_bridge/component/navigation.dart';
import 'package:brand_bridge/component/NavBar.dart';
import 'package:brand_bridge/pages/ProfilePage.dart';
import 'package:brand_bridge/pages/SettingsPage.dart';
import 'package:brand_bridge/pages/chatPage.dart';
import 'package:brand_bridge/pages/homePage.dart';
import 'package:brand_bridge/pages/login.dart';
import 'package:brand_bridge/pages/signUp.dart';
import 'package:brand_bridge/pages/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    // const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/NavBar': (context) => const NavBar(),
        '/LoginPage': (context) => const LoginPage(),
        '/Signup': (context) => const Signup(),
        '/home': (context) => const HomePage(),
        '/ChatPage': (context) => const ChatPage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/SettingPage': (context) => const SettingPage(),
      },
    );
  }
}
