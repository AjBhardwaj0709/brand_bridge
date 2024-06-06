import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
        child: Center(
          child: SafeArea(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: ElementColor.primaryColor,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: ElementColor
                            .primaryColor, // Color when the TextField is focused
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: ElementColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Textbox for username:
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'UserName',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your Name",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                            color: ElementColor.primaryColor, width: 3.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: " Create PassWord",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: ElementColor.primaryColor,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: ElementColor
                            .primaryColor, // Color when the TextField is focused
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

                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(ElementColor.primaryColor)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),

                const SizedBox(
                  height: 10,
                ),

                const Row(
                  children: [
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
                    'lib/images/google.png',
                    height: 40,
                  ),
                ),
              ]),
            ),
          )),
        ),
      ),
    );
  }
}
