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
      logoPath: 'assets/images/leagues/league-1-logo.jpg',
      title: 'Nova 11',
      description:
          'Esta liga de fútbol 11 se centra en el talento emergente y las promesas del fútbol mundial.',
      city: 'CDMX, México',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-2.jpg',
      logoPath: 'assets/images/leagues/league-2-logo.jpg',
      title: 'Premier Fut',
      description:
          'Liga internacional que reúne a equipos de diferentes continentes en la competencia más ambiciosa del fútbol 11.',
      city: 'Puebla, México',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-3.jpg',
      logoPath: 'assets/images/leagues/league-3-logo.jpg',
      title: 'Elite League',
      description:
          'Solo los equipos con precisión y estrategia sobreviven. Esta liga de fútbol 7 combina lo mejor de la táctica y la agilidad.',
      city: 'Guadalajara, México',
    ),
    League(
      imagePath: 'assets/images/ligas/liga-4.jpg',
      logoPath: 'assets/images/leagues/league-4-logo.jpg',
      title: 'Futzone 5',
      description:
          'FutZone 5 es una liga de fútbol 5 caracterizada por su rapidez y emoción con partidos cortos pero llenos de acción.',
      city: "Monterrey, México",
    ),
    League(
      imagePath: 'assets/images/ligas/liga-5.jpg',
      logoPath: 'assets/images/leagues/league-5-logo.jpg',
      title: 'Olympic Futbol',
      description:
          'La liga más prestigiosa de fútbol 7, donde solo los equipos más élite compiten. Inspirada en los dioses del Olimpo.',
      city: 'CDMX, México',
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
