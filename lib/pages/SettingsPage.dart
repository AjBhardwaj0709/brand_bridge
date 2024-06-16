import 'package:brand_bridge/authentication/auth_service.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  void logOut(BuildContext context) async {
    // Get Auth Service
    final _auth = AuthService();
    await _auth.signOut(); // Correctly call signOut method
    Navigator.of(context).pushReplacementNamed('/AuthGate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Settings",
          style: TextStyle(color: ElementColor.primaryColor, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          // Logout button
          IconButton(onPressed: () => logOut(context), icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
      ),
    );
  }
}
