// import 'package:brand_bridge/component/navigation.dart';
import 'package:brand_bridge/authentication/auth_service.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  void logOut(BuildContext context) {
    //get Auth Service

    final _auth = AuthService();
    _auth.singOut;
    Navigator.of(context).pushReplacementNamed('/LoginPage');
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
          //logout bUtton
          IconButton(onPressed:()=> logOut(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
      ),
    );
  }
}
