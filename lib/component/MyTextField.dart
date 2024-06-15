// ignore_for_file: prefer_const_constructors

import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String LabelText;
  final bool obscuretext;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.LabelText,
      required this.obscuretext,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuretext,
      controller: controller,
      decoration: InputDecoration(
        labelText: LabelText,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide:
                BorderSide(color: ElementColor.primaryColor, width: 3.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ElementColor
                .primaryColor, // Color when the TextField is focused
            width: 3.0,
          ),
        ),
        prefixIcon: Icon(icon, color: ElementColor.primaryColor),
      ),
    );
  }
}
