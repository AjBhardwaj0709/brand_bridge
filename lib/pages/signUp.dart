import 'package:brand_bridge/authentication/auth_service.dart';
import 'package:brand_bridge/component/MyTextField.dart';
import 'package:brand_bridge/component/my_Button.dart';
import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  Signup({super.key});

  void signUp(BuildContext context) async {
    final _auth = AuthService();

    // Show a loading indicator while the sign-up process is happening
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await _auth.signUpWithEmailAndPasswor(
          mailController.text, pwController.text);

      // If sign-up is successful, close the loading indicator
      Navigator.of(context).pop();

      // Clear the input fields
      mailController.clear();
      pwController.clear();

      // Show a success message (optional)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign-Up Successful'),
          content: const Text('Your account has been created.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacementNamed(
                    '/LoginPage'); // Navigate to login page
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Close the loading indicator
      Navigator.of(context).pop();

      // Show an error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign-Up Failed'),
          content: Text(e.toString()), // You might want to handle this better
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
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
        child: Center(
          child: SafeArea(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                MyTextField(
                    hintText: 'Enter your Email',
                    icon: Icons.mail,
                    LabelText: 'Email',
                    obscuretext: false,
                    controller: mailController),
                const SizedBox(height: 20),
                //Textbox for username:
                MyTextField(
                    hintText: 'Enter your name',
                    icon: Icons.person,
                    LabelText: 'UserName',
                    obscuretext: false,
                    controller: usernameController),
                //End of Username Textbox
                const SizedBox(
                  height: 20.0,
                ),

                //text box for password:
                MyTextField(
                    hintText: 'Enter your password',
                    icon: Icons.lock,
                    LabelText: 'Create Password',
                    obscuretext: true,
                    controller: pwController),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20.0,
                ),
                // MyButton(text: 'Sign Up'),

                const SizedBox(
                  height: 10,
                ),

                MyButton(
                  text: "Sign Up",
                  onPressed: () => signUp(context),
                ),

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
                    'lib/assets/google.png',
                    height: 40,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Already a member ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ElementColor.textColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/LoginPage');
                    },
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ElementColor.primaryColor),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 20.0,
                ),
              ]),
            ),
          )),
        ),
      ),
    );
  }
}
