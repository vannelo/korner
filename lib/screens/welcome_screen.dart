import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
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
