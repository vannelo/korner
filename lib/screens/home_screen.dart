import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:korner/models/player.dart';
import 'package:korner/screens/explore_screen.dart';
import '../widgets/league_card.dart';
import '../widgets/player_card.dart';
import '../widgets/icon_widget.dart';
import '../widgets/match_card.dart';
import '../services/data_service.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const ExploreScreen(),
    const Center(child: Text('Notificaciones Screen')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_soccer,
              color: Colors.black,
            ),
            label: 'Explora',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarousel(context),
          const SizedBox(height: 16),
          _buildIconSection(),
          _buildSectionTitle('Ligas'),
          _buildLeagueSection(),
          _buildSectionTitle('Jugadores Destacados'),
          _buildPlayerSection(),
          _buildSectionTitle('Partidos Abiertos'),
          _buildMatchSection(),
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          items: DataService.carouselImages.map((imagePath) {
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
                              stops: const [0.3, 1],
                            ),
                          ),
                        ),
                      ),
                      _buildCarouselText(context),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        _buildCarouselIndicators(),
      ],
    );
  }

  Widget _buildCarouselText(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0),
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
              const SizedBox(height: 8),
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
    );
  }

  Widget _buildCarouselIndicators() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(DataService.carouselImages.length, (index) {
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentSlide == index
                  ? Colors.white.withOpacity(0.9)
                  : Colors.white.withOpacity(0.4),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIconSection() {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: DataService.icons.map((icon) {
            return IconWidget(
              imagePath: icon.imagePath,
              label: icon.label,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Text(
        title,
        style: GoogleFonts.barlow(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLeagueSection() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: DataService.leagues.length,
        itemBuilder: (context, index) {
          final league = DataService.leagues[index];
          return LeagueCard(
            imagePath: league.imagePath,
            title: league.title,
            description: league.description,
          );
        },
      ),
    );
  }

  Widget _buildPlayerSection() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: DataService.players.length,
        itemBuilder: (context, index) {
          final player = DataService.players[index];
          return PlayerCard(player: player, type: PlayerCardType.standard);
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
}
