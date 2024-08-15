import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/league.dart';
import '../models/player.dart';
import '../widgets/league_card.dart';
import '../widgets/player_card.dart';
import '../widgets/icon_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0; // Track the active slide index

  // Sample data for leagues
  final List<League> leagues = [
    League(
      imagePath: 'assets/images/ligas/liga-1.jpg',
      title: 'Premier League',
      description: 'Top English football league.',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-2.jpg',
      title: 'La Liga',
      description: 'Top Spanish football league.',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-3.jpg',
      title: 'Serie A',
      description: 'Top Italian football league.',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-4.jpg',
      title: 'Bundesliga',
      description: 'Top German football league.',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-5.jpg',
      title: 'Ligue 1',
      description: 'Top French football league.',
    ),
  ];

  // Sample data for players
  final List<Player> players = [
    Player(
      imagePath: 'assets/images/jugadores/jugador-1.jpg',
      name: 'Cristiano Ronaldo',
      city: 'Madeira, Portugal',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-2.jpg',
      name: 'Lionel Messi',
      city: 'Rosario, Argentina',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-3.jpg',
      name: 'Neymar Jr',
      city: 'Mogi das Cruzes, Brazil',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-4.jpg',
      name: 'Kylian Mbappé',
      city: 'Paris, France',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-5.jpg',
      name: 'Mohamed Salah',
      city: 'Nagrig, Egypt',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-6.jpg',
      name: 'Robert Lewandowski',
      city: 'Warsaw, Poland',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            // Carousel Section
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index; // Update the active slide index
                      });
                    },
                  ),
                  items: [
                    'assets/images/slider/slider-1.jpg',
                    'assets/images/slider/slider-2.jpg',
                    'assets/images/slider/slider-3.jpg',
                  ].map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent,
                                      ],
                                      stops: [0.3, 1],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 56.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'KORNER LOREM IPSUM',
                                          style: GoogleFonts.barlow(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Dolor sit amet consectetur',
                                          style: GoogleFonts.barlow(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1, 2].map((index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentSlide == index
                              ? Colors.white.withOpacity(0.9)
                              : Colors.white.withOpacity(0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            // Icons Section
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-1.png',
                        label: 'Partidos'),
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-2.png',
                        label: 'Jugadores'),
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-3.png',
                        label: 'Ligas'),
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-4.png',
                        label: 'Canchas'),
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-5.png',
                        label: 'Arbitros'),
                    IconWidget(
                        imagePath: 'assets/images/icons/section-icon-6.png',
                        label: 'Social'),
                  ],
                ),
              ),
            ),
            // "Ligas" Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ligas',
                style: GoogleFonts.barlow(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Scrollable "Ligas" Section
            Container(
              height: 160, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: leagues.length,
                itemBuilder: (context, index) {
                  final league = leagues[index];
                  return LeagueCard(
                    imagePath: league.imagePath,
                    title: league.title,
                    description: league.description,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // "Jugadores Destacados" Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Jugadores Destacados',
                style: GoogleFonts.barlow(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Scrollable "Jugadores Destacados" Section
            Container(
              height: 250, // Taller container for vertical player cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return PlayerCard(
                    imagePath: player.imagePath,
                    name: player.name,
                    city: player.city,
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            // Add more sections or content here if needed
          ],
        ),
      ),
    );
  }
}
