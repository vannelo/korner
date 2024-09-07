import 'package:flutter/material.dart';

class TournamentScreen extends StatelessWidget {
  final String tournamentName;
  final String leagueName;
  final String leagueLogo;

  const TournamentScreen({
    super.key,
    required this.tournamentName,
    required this.leagueName,
    required this.leagueLogo,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            _buildHeader(context),
            const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: 'Partidos'),
                Tab(text: 'Tabla'),
                Tab(text: 'Goleadores'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNextMatchesSection(),
                  _buildTeamStandingsSection(),
                  _buildPlayerGoalsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/leagues/league-cover-1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          tournamentName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          leagueName,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildNextMatchesSection() {
    final weeks = [
      {
        'week': 'Domingo 18 de Junio',
        'matches': [
          {
            'team1': 'Team A',
            'team2': 'Team B',
            'day': 'Domingo',
            'hour': '14:00'
          },
          {
            'team1': 'Team C',
            'team2': 'Team D',
            'day': 'Domingo',
            'hour': '16:00'
          },
          {
            'team1': 'Team E',
            'team2': 'Team F',
            'day': 'Domingo',
            'hour': '18:00'
          },
        ]
      },
      {
        'week': 'Domingo 11 de Junio',
        'matches': [
          {
            'team1': 'Team G',
            'team2': 'Team H',
            'day': 'Domingo',
            'hour': '14:00'
          },
          {
            'team1': 'Team I',
            'team2': 'Team J',
            'day': 'Domingo',
            'hour': '16:00'
          },
          {
            'team1': 'Team K',
            'team2': 'Team L',
            'day': 'Domingo',
            'hour': '18:00'
          },
        ]
      },
      {
        'week': 'Domingo 4 de Junio',
        'matches': [
          {
            'team1': 'Team M',
            'team2': 'Team N',
            'day': 'Domingo',
            'hour': '14:00'
          },
          {
            'team1': 'Team O',
            'team2': 'Team P',
            'day': 'Domingo',
            'hour': '16:00'
          },
          {
            'team1': 'Team Q',
            'team2': 'Team R',
            'day': 'Domingo',
            'hour': '18:00'
          },
        ]
      }
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: weeks.map((week) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              week['week'] as String,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            ...((week['matches'] as List<Map<String, String>>).map((match) {
              return Card(
                color: Colors.white, // Explicit white background
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('${match['team1']} vs ${match['team2']}'),
                  subtitle: Text('${match['day']} - ${match['hour']}'),
                ),
              );
            })),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTeamStandingsSection() {
    final standings = [
      {
        'team': 'Team A',
        'points': 12,
        'won': 4,
        'lost': 0,
        'logo': 'assets/images/teams/team-1.jpg'
      },
      {
        'team': 'Team B',
        'points': 9,
        'won': 3,
        'lost': 1,
        'logo': 'assets/images/teams/team-2.jpg'
      },
      {
        'team': 'Team C',
        'points': 6,
        'won': 2,
        'lost': 2,
        'logo': 'assets/images/teams/team-3.jpg'
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: standings.length,
      itemBuilder: (context, index) {
        final standing = standings[index];
        return Card(
          color: Colors.white, // Explicit white background
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(standing['logo'] as String),
            ),
            title: Text(standing['team'] as String),
            subtitle: Text(
                'Puntos: ${standing['points']}, Ganados: ${standing['won']}, Perdidos: ${standing['lost']}'),
          ),
        );
      },
    );
  }

  Widget _buildPlayerGoalsSection() {
    final playerGoals = [
      {'player': 'Jugador A', 'goals': 10},
      {'player': 'Jugador B', 'goals': 8},
      {'player': 'Jugador C', 'goals': 7},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: playerGoals.length,
      itemBuilder: (context, index) {
        final player = playerGoals[index];
        return Card(
          color: Colors.white, // Explicit white background
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(player['player'] as String),
            subtitle: Text('Goles: ${player['goals']}'),
          ),
        );
      },
    );
  }
}
