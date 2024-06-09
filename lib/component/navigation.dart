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
  int index=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<SMIBool> riveIconInput = [];
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
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff09203f),
                        offset: Offset(0, 20),
                        blurRadius: 20,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(bottomItems.length, (index) {
                    final riveIcon = bottomItems[index].rive;
                    return GestureDetector(
                      onTap: () {
                        riveIconInput[index].change(true);
                        Future.delayed(const Duration(seconds: 1), () {
                          riveIconInput[index].change(false);
                        });
                      },
                      child: SizedBox(
                        height: 36,
                        width: 36,
                        child: RiveAnimation.asset(riveIcon.src,
                            artboard: riveIcon.artboard, onInit: (artboard) {
                          StateMachineController? controller =
                              StateMachineController.fromArtboard(
                                  artboard, riveIcon.machine);

                          artboard.addController(controller!);

                          riveIconInput.add(
                              controller.findInput<bool>('active') as SMIBool);
                        }
                            // stateMachines: [bottomItems[index].rive.machine],
                            ),
                      ),
                      //  ColorFiltered(
                      //   colorFilter: ColorFilter.mode(
                      //     _selectedIndex == index
                      //         ? ElementColor.primaryColor // Selected color
                      //         : Colors.white54, // Unselected color
                      //     BlendMode.srcIn,
                      //   ),

                    );
                  }
                      
                      // ),
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
