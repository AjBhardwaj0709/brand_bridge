import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Chat",
          style: TextStyle(color: ElementColor.primaryColor, fontSize: 30),
        ),
        backgroundColor:
            Colors.transparent, // Set app bar background color to transparent
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.gradientBackground),
      ),
    );
  }
}
