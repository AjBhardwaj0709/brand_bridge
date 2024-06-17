// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brand_bridge/component/MyTextField.dart';
import 'package:brand_bridge/component/forget_Password_BottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:brand_bridge/authentication/auth_service.dart';
import 'package:brand_bridge/component/my_button.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final AuthService authService = AuthService();

  void login(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await authService.signInWithEmailAndPassword(
        mailController.text,
        pwController.text,
      );

      Navigator.of(context).pop(); // Dismiss loading indicator

      Navigator.pushReplacementNamed(
          context, '/NavBar'); // Navigate to main screen
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading indicator

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: Text('An error occurred: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _loginWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await authService.loginWithGoogle(context);

      Navigator.of(context).pop(); // Dismiss loading indicator

      Fluttertoast.showToast(
        msg: 'Successfully logged in!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacementNamed(
          context, '/NavBar'); // Navigate to main screen
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading indicator

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Google Sign-In Failed'),
          content: Text('An error occurred: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Connect to Success",
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: ElementColor.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hintText: 'Enter your Email or username',
                    icon: Icons.person,
                    LabelText: 'Username',
                    obscuretext: false,
                    controller: mailController,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hintText: 'Enter your Password',
                    obscuretext: true,
                    icon: Icons.lock,
                    LabelText: 'Password',
                    controller: pwController,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ForgetPasswordBottomSHeet.showmodalBottomSheet(context);
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ElementColor.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Sign In',
                    onPressed: () => login(context),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ElementColor.textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _loginWithGoogle(context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'lib/assets/google.png',
                        height: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ElementColor.textColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Signup');
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ElementColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
