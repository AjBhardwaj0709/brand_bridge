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
  List<SMIBool?> riveIconInput =
      List<SMIBool?>.filled(bottomItems.length, null);

  void animateTheIcon(int index) {
    // Ensure the index is within the bounds of the riveIconInput list
    if (index >= 0 && index < riveIconInput.length) {
      // Reset all icons first
      for (var input in riveIconInput) {
        if (input != null) {
          input.change(false);
        }
      }

      // Then, activate the selected icon
      if (riveIconInput[index] != null) {
        riveIconInput[index]!.change(true);
      }

      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void riveOnInit(Artboard artboard,
      {required String machine, required int index}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, machine);

    if (controller != null) {
      artboard.addController(controller);

      SMIBool input = controller.findInput<bool>('active') as SMIBool;
      riveIconInput[index] = input;

      // Initialize the input state to false
      input.change(false);
    }
  }

  @override
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
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(bottomItems.length, (index) {
                    final riveIcon = bottomItems[index].rive;
                    return GestureDetector(
                      onTap: () {
                        animateTheIcon(index);
                      },
                      child: SizedBox(
                        height: 36,
                        width: 36,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard) {
                            riveOnInit(artboard,
                                machine: riveIcon.machine, index: index);
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
