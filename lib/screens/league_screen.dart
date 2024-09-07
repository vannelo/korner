import 'package:flutter/material.dart';
import 'package:korner/screens/home_screen.dart';
import '../services/data_service.dart';
import '../widgets/team_card.dart';
import '../widgets/tournament_card.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/leagues/league-cover-1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  transform: Matrix4.translationValues(0, -32, 0),
                  child: Image.asset(
                    'assets/images/utils/divider.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          AssetImage('assets/images/leagues/league-logo-1.jpg'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Olympus Futbol',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Liga de Futbol 7 | CDMX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Somos una liga de futbol 7 en la Ciudad de México. ¡Únete a nosotros y vive la pasión del futbol!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildColumn(context, '9', 'Ranking'),
                      _buildVerticalDivider(),
                      _buildColumn(context, '20K', 'Seguidores'),
                      _buildVerticalDivider(),
                      _buildColumn(context, '65', 'Equipos'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(64),
                            ),
                            backgroundColor: Colors.black87,
                            shadowColor: Colors.black.withOpacity(0.2),
                          ),
                          child: const Text(
                            'Seguir',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          onPressed: () {
                            // Add message functionality here
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(64),
                            ),
                            side: const BorderSide(color: Colors.black54),
                          ),
                          child: const Text(
                            'Mensaje',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150, // Adjust width as needed
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/leagues/league-gallery-$index.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildSectionTitle(context, 'Equipos en la Liga'),
                  _buildTeamSection(),
                  const SizedBox(height: 8),
                  _buildSectionTitle(context, 'Torneos'),
                  _buildTournamentSection(),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildSectionTitle(context, 'Reseñas'),
                  SizedBox(
                    height: 120, // Reduced height
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: 5, // Adjust based on your data
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200, // Adjust width as needed
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black12, // Solid gray border
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    Icons.star,
                                    color: starIndex < 4
                                        ? Colors.orange
                                        : Colors.grey,
                                    size: 14, // Reduced star size
                                  );
                                }),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Excelente Jugador',
                                style: TextStyle(
                                  fontSize: 14, // Reduced font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Ronaldo es un jugador increíble con una gran habilidad para anotar goles en cualquier situación.',
                                style: TextStyle(
                                  fontSize: 12, // Reduced font size
                                  color: Colors.black54,
                                ),
                                maxLines: 2, // Adjust for smaller height
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.black12,
      margin: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget _buildTournamentSection() {
    // Example tournament data
    final tournaments = [
      {'name': 'Torneo de Invierno', 'category': 'Futbol 7', 'isActive': true},
      {
        'name': 'Copa de Primavera',
        'category': 'Futbol Sala',
        'isActive': false
      },
      {
        'name': 'Campeonato Nacional',
        'category': 'Futbol 11',
        'isActive': true
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          final tournament = tournaments[index];
          return TournamentCard(
            name: tournament['name']!.toString(),
            category: tournament['category']! as String,
            isActive: tournament['isActive']! as bool,
          );
        },
      ),
    );
  }
}
