import 'package:flutter/material.dart';
import '../models/team.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final hasValidImage = team.logoPath != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: hasValidImage ? Colors.transparent : Colors.black,
            backgroundImage: hasValidImage ? AssetImage(team.logoPath!) : null,
            child: !hasValidImage
                ? Text(
                    team.name.substring(0, 2).toUpperCase(),
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
              team.name,
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
  }
}
