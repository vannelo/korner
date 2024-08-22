import '../models/league.dart';
import '../models/player.dart';
import '../models/icon_item.dart';
import '../models/match.dart';
import '../models/team.dart'; // Import the Team model

class DataService {
  static List<String> carouselImages = [
    'assets/images/slider/slider-1.jpg',
    'assets/images/slider/slider-2.jpg',
    'assets/images/slider/slider-3.jpg',
  ];

  static List<League> leagues = [
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

  static List<Player> players = [
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
      city: 'Das Cruzes, Brazil',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-4.jpg',
      name: 'Jude Bellingham',
      city: 'London, England',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-5.jpg',
      name: 'Vinicius Jr',
      city: 'Nagrig, Brazil',
    ),
    Player(
      imagePath: 'assets/images/jugadores/jugador-6.jpg',
      name: 'Eerling Haaland',
      city: 'Warsaw, Poland',
    ),
  ];

  static List<IconItem> icons = [
    IconItem(
        imagePath: 'assets/images/icons/section-icon-1.png', label: 'Ligas'),
    IconItem(
        imagePath: 'assets/images/icons/section-icon-2.png', label: 'Partidos'),
    IconItem(
        imagePath: 'assets/images/icons/section-icon-3.png', label: 'Equipos'),
    IconItem(
        imagePath: 'assets/images/icons/section-icon-4.png',
        label: 'Jugadores'),
    IconItem(
        imagePath: 'assets/images/icons/section-icon-5.png',
        label: 'Estadisticas'),
  ];

  static List<Match> matches = [
    Match(
      imagePath: 'assets/images/ligas/liga-5.jpg',
      date: DateTime(2024, 8, 20, 18, 30),
      type: '5v5',
      place: 'Stadium A',
    ),
    Match(
      imagePath: 'assets/images/ligas/liga-4.jpg',
      date: DateTime(2024, 8, 21, 19, 00),
      type: '7v7',
      place: 'Court B',
    ),
    Match(
      imagePath: 'assets/images/ligas/liga-3.jpg',
      date: DateTime(2024, 8, 22, 20, 00),
      type: '11v11',
      place: 'Arena C',
    ),
    Match(
      imagePath: 'assets/images/ligas/liga-2.jpg',
      date: DateTime(2024, 8, 23, 21, 30),
      type: '3v3',
      place: 'Stadium A',
    ),
    Match(
      imagePath: 'assets/images/ligas/liga-1.jpg',
      date: DateTime(2024, 8, 24, 22, 00),
      type: '7v7',
      place: 'Court B',
    ),
  ];

  static List<Team> teams = [
    Team(
      logoPath: 'assets/images/teams/team-1.jpg',
      name: 'Real Madrid',
    ),
    Team(
      logoPath: 'assets/images/teams/team-2.jpg',
      name: 'Barcelona',
    ),
    Team(
      logoPath: 'assets/images/teams/team-3.jpg',
      name: 'Juventus',
    ),
    Team(
      logoPath: 'assets/images/teams/team-4.jpg',
      name: 'Bayern Munich',
    ),
    Team(
      logoPath: 'assets/images/teams/team-5.jpg',
      name: 'PSG',
    ),
  ];
}
