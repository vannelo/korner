import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeagueCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String logoPath;
  final String city;

  const LeagueCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.logoPath,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.barlow(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  city,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(logoPath),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
