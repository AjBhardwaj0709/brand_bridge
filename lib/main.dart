// import 'package:brand_bridge/component/navigation.dart';
import 'dart:io';

import 'package:brand_bridge/authentication/auth_gate.dart';
import 'package:brand_bridge/component/NavBar.dart';
import 'package:brand_bridge/pages/ProfilePage.dart';
import 'package:brand_bridge/pages/SettingsPage.dart';
import 'package:brand_bridge/pages/chatPage.dart';
import 'package:brand_bridge/pages/homePage.dart';
import 'package:brand_bridge/pages/login.dart';
import 'package:brand_bridge/pages/signUp.dart';
import 'package:brand_bridge/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyB36uXXwGMg0KKed9lWy9T37UWCcnyWbDc",
              appId: "1:1084930896982:android:e1b2a43410e3d9298b77f7",
              messagingSenderId: "1084930896982",
              projectId: "brand-bridge-6c138"))
      : await Firebase.initializeApp();
  runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => const MyApp(),
    const MyApp(),
//     ),
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
        '/LoginPage': (context) => LoginPage(),
        '/Signup': (context) => Signup(),
        '/home': (context) => const HomePage(),
        '/ChatPage': (context) => const ChatPage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/SettingPage': (context) => const SettingPage(),
        '/AuthGate': (context) => AuthGate(),
      },
    );
  }
}
