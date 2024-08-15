import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/league.dart';
import '../models/player.dart';
import '../models/match.dart'; // Import the Match model
import '../widgets/league_card.dart';
import '../widgets/player_card.dart';
import '../widgets/icon_widget.dart';
import '../widgets/match_card.dart'; // Import the MatchCard widget
import '../services/data_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarousel(),
            _buildIconSection(),
            _buildSectionTitle('Ligas'),
            _buildLeagueSection(),
            _buildSectionTitle('Jugadores Destacados'),
            _buildPlayerSection(),
            _buildSectionTitle('Partidos Abiertos'),
            _buildMatchSection(),
            SizedBox(height: 64), // Add white space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: Duration(seconds: 5),
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
                              stops: [0.3, 1],
                            ),
                          ),
                        ),
                      ),
                      _buildCarouselText(),
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

  Widget _buildCarouselText() {
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
    );
  }

  Widget _buildCarouselIndicators() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [0, 1, 2].map((index) {
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentSlide == index
                  ? Colors.white.withOpacity(0.9)
                  : Colors.white.withOpacity(0.4),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIconSection() {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 16.0),
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
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: DataService.players.length,
        itemBuilder: (context, index) {
          final player = DataService.players[index];
          return PlayerCard(
            imagePath: player.imagePath,
            name: player.name,
            city: player.city,
          );
        },
      ),
    );
  }

  Widget _buildMatchSection() {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
