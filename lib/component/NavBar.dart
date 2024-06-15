import 'package:brand_bridge/pages/ProfilePage.dart';
import 'package:brand_bridge/pages/SettingsPage.dart';
import 'package:brand_bridge/pages/chatPage.dart';
import 'package:brand_bridge/pages/homePage.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChatPage(),
    ProfilePage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          // Navigation Bar
          Positioned(
            left: 10,
            right: 10,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xff09203f),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff09203f),
                    // spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 20),
                  )
                ]
              ),
              child: GNav(
                gap: 8,
                backgroundColor:Color(0xff09203f),
                color: ElementColor.textColor,
                activeColor: ElementColor.primaryColor,
                tabBackgroundColor: ElementColor.primaryColor.withOpacity(0.1),
                iconSize: 25,
                padding: const EdgeInsets.all(16),
                onTabChange: _onItemTapped,
                tabs: const [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(icon: Icons.chat, text: 'Chat'),
                  GButton(icon: Icons.person, text: 'Profile'),
                  GButton(icon: Icons.settings, text: 'Settings'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
