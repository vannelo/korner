import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final PlayerCardType type;

  const PlayerCard({
    Key? key,
    required this.player,
    this.type = PlayerCardType.standard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == PlayerCardType.circular) {
      final hasValidImage = player.imagePath != null;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor:
                  hasValidImage ? Colors.transparent : Colors.black,
              backgroundImage:
                  hasValidImage ? AssetImage(player.imagePath!) : null,
              child: !hasValidImage
                  ? Text(
                      player.name.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 100,
              child: Text(
                player.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    } else {
      final hasValidImage = player.imagePath != null;

      return Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: hasValidImage
              ? DecorationImage(
                  image: AssetImage(player.imagePath!),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage(
                      "assets/images/jugadores/user-placeholder.jpg"),
                  fit: BoxFit.cover,
                ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    stops: const [0.3, 1],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.name,
                    style: GoogleFonts.barlow(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    player.city,
                    style: GoogleFonts.barlow(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
