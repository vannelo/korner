import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your home screen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/perfil/perfil-bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  transform: Matrix4.translationValues(0, -34, 0),
                  child: Image.asset(
                    'assets/images/perfil/perfil-divider.png',
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
                          AssetImage('assets/images/perfil/perfil-jugador.jpg'),
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
                    'Cristiano Ronaldo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Delantero',
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
                      'Soy un delantero explosivo con un gran instinto goleador. Mi velocidad y capacidad para desmarcarme destacan.',
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
                      _buildColumn(context, '5', 'Nivel'),
                      _buildVerticalDivider(),
                      _buildColumn(context, '10K', 'Seguidores'),
                      _buildVerticalDivider(),
                      _buildColumn(context, '120', 'Partidos'),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Galería',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150, // Adjust width as needed
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/perfil/galeria-$index.jpg'), // Use images from galeria-0.jpg to galeria-5.jpg
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Donde ha jugado',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: 5, // Adjust based on your data
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200, // Adjust width as needed
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12, // Solid gray border
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ligas/liga-$index.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Lugar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Descripción del lugar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reseñas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
}
