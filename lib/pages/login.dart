// ignore_for_file: prefer_const_constructors

import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Email or Username",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(
                              color: ElementColor.primaryColor, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          color: ElementColor
                              .primaryColor, // Color when the TextField is focused
                          width: 3.0,
                        ),
                      ),
                      prefixIcon:
                          Icon(Icons.person, color: ElementColor.primaryColor),
                    ),
                  ),
                  //End of Username Textbox
                  const SizedBox(
                    height: 20.0,
                  ),

                  //text box for password:
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Enter your PassWord",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          color: ElementColor.primaryColor,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          color: ElementColor.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ElementColor.primaryColor,
                      ),
                    ),
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              ElementColor.primaryColor)),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),

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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'lib/assets/google.png',
                      height: 40,
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
