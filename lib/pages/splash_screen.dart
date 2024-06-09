import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/LoginPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff09203f),
            Color(0xff537895),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: const Center(
          child: Text(
            "Brand Bridge",
            style: TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
