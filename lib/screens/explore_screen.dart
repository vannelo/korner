import 'package:flutter/material.dart';
import 'package:korner/models/player.dart';
import '../widgets/match_card.dart';
import '../services/data_service.dart';
import '../widgets/league_card.dart';
import '../widgets/team_card.dart';
import '../widgets/player_card.dart';
import '../screens/league_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 64),
            _buildSectionTitle(context, 'Ligas'),
            _buildLeagueSection(context),
            _buildSectionTitle(context, 'Partidos Abiertos'),
            _buildMatchSection(),
            _buildSectionTitle(context, 'Equipos Abiertos'),
            _buildTeamSection(),
            _buildSectionTitle(context, 'Jugadores'),
            _buildPlayerSection(),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Ver todo',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeagueSection(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: DataService.leagues.length,
        itemBuilder: (context, index) {
          final league = DataService.leagues[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeagueScreen(
                    leagueTitle: league.title,
                    leagueCover: league.imagePath,
                    leagueLogo: league.logoPath,
                    leagueCity: league.city,
                    leagueDescription: league.description,
                  ),
                ),
              );
            },
            child: LeagueCard(
              imagePath: league.imagePath,
              title: league.title,
              logoPath: league.logoPath,
              city: league.city,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMatchSection() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: DataService.matches.length,
        itemBuilder: (context, index) {
          final match = DataService.matches[index];
          return MatchCard(
            match: match,
          );
        },
      ),
    );
  }

  Widget _buildTeamSection() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: DataService.teams.length,
        itemBuilder: (context, index) {
          final team = DataService.teams[index];
          return TeamCard(team: team);
        },
      ),
    );
  }

  Widget _buildPlayerSection() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: DataService.players.length,
        itemBuilder: (context, index) {
          final player = DataService.players[index];
          return PlayerCard(player: player, type: PlayerCardType.circular);
        },
      ),
    );
  }
}
