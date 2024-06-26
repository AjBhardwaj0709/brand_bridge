import 'package:flutter/material.dart';
import 'package:brand_bridge/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Brand Bridge',
          style: TextStyle(
              color: ElementColor.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
      ),
    );
  }
}
