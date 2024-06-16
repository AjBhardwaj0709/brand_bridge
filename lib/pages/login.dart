// ignore_for_file: prefer_const_constructors

import 'package:brand_bridge/authentication/auth_service.dart';
import 'package:brand_bridge/component/MyTextField.dart';
import 'package:brand_bridge/component/my_Button.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mailController = TextEditingController();

  final TextEditingController pwController = TextEditingController();

  final authService = AuthService();

// Login with credintial
  void login(BuildContext context) async {
    final authService = AuthService();

    // Show a loading indicator while the login process is happening
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await authService.signInWithEmailAndPassword(
          mailController.text, pwController.text);

      // If login is successful, close the loading indicator
      Navigator.of(context).pop();

      // Optionally, navigate to another screen
      Navigator.of(context).pushReplacementNamed('/NavBar');
    } catch (e) {
      // Close the loading indicator
      Navigator.of(context).pop();

      // Show an error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text(e.toString()), // You might want to handle this better
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

// Login with Google
  void _signInWithGoogle(BuildContext context) async {
    try {
      await authService.signInWithGoogleAndSaveUserData();
      // Navigate to the next screen after successful login
      Navigator.pushReplacementNamed(context, '/NavBar');
    } catch (e) {
      print('Error signing in with Google: $e');
      // Handle error (show error dialog, etc.)
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
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Connect to Success",
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          fontSize: 15, color: ElementColor.textColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Textbox for username:
                  MyTextField(
                    hintText: 'Enter your Email or username',
                    icon: Icons.person,
                    LabelText: 'Username',
                    obscuretext: false,
                    controller: mailController,
                  ),
                  //End of Username Textbox
                  const SizedBox(
                    height: 20.0,
                  ),

                  //text box for password:
                  MyTextField(
                    hintText: 'Enter your Password',
                    obscuretext: true,
                    icon: Icons.lock,
                    LabelText: 'Password',
                    controller: pwController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // For Forget password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forget Pasword",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ElementColor.textColor),
                        ),
                      ],
                    ),
                  ),
                  //End of password textbox

                  const SizedBox(
                    height: 20.0,
                  ),

                  MyButton(
                    text: 'Sign In',
                    onPressed: () => login(context),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: const [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ElementColor.textColor),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _signInWithGoogle(context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'lib/assets/google.png',
                        height: 40,
                      ),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ElementColor.textColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/Signup');
                      },
                      child: Text(
                        'Regester now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ElementColor.primaryColor),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
