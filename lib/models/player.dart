enum PlayerCardType {
  circular,
  standard,
}

class Player {
  final String? imagePath;
  final String name;
  final String city;

  Player({
    required this.imagePath,
    required this.name,
    required this.city,
  });
}
