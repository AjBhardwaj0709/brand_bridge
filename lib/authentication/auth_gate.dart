import 'package:brand_bridge/component/NavBar.dart';
import 'package:brand_bridge/pages/homePage.dart';
import 'package:brand_bridge/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check for loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check for error state
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          // Check for authentication state
          if (snapshot.hasData) {
            return const NavBar();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
