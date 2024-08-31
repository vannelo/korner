import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const IconWidget({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.barlow(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
