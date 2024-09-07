import 'package:flutter/material.dart';
import '../screens/tournament_screen.dart';

class TournamentCard extends StatelessWidget {
  final String name;
  final String category;
  final bool isActive;

  const TournamentCard({
    super.key,
    required this.name,
    required this.category,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TournamentScreen(
              tournamentName: name,
              leagueName: 'Olympus Futbol',
              leagueLogo: 'assets/images/leagues/league-logo-1.jpg',
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: isActive ? Colors.green : Colors.red,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const Spacer(),
            Text(
              isActive ? 'Activo' : 'Inactivo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
