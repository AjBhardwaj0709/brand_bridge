import 'package:brand_bridge/component/navigation.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            "Brand Bridge",
            style: TextStyle(color: ElementColor.textColor),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff09203f),
        ),
      ),
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => const Navigation(),
          );
        },
      ),
    );
  }
}
