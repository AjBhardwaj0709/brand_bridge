import 'package:brand_bridge/component/navigationBarItems.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
   int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.gradientBackground),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xff09203f),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    bottomItems.length,
                    (index) => GestureDetector(
                      onTap: () => _onItemTapped(index),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == index
                              ? ElementColor.primaryColor // Selected color
                              : Colors.white54, // Unselected color
                          BlendMode.srcIn,
                        ),
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            bottomItems[index].rive.src,
                            artboard: bottomItems[index].rive.artboard,
                            stateMachines: [bottomItems[index].rive.machine],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}