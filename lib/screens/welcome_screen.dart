// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind AppBar
      body: GestureDetector(
        onTap: () {
          // Navigate to HomeScreen when the screen is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome-bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/korner-text.png',
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
