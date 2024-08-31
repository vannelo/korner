// lib/widgets/match_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/match.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Fixed width for each card
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12, // Solid gray border
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(match.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Date and Time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              DateFormat('dd MMM yyyy, HH:mm').format(match.date),
              style: GoogleFonts.barlow(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Type and Place
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "${match.type} - ${match.place}",
              style: GoogleFonts.barlow(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Availability or Additional Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Faltan 2 jugadores", // This is just an example; you can change it based on your data
              style: GoogleFonts.barlow(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
          // Adding space at the bottom for better padding
        ],
      ),
    );
  }
}
