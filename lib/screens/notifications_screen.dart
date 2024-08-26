import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
            top: 64.0, left: 16.0, right: 16.0, bottom: 16.0),
        children: [
          _buildNotificationItem(
            context,
            icon: Icons.person_add,
            title: 'Nuevo seguidor',
            description: 'John Doe te ha seguido.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.group,
            title: 'Equipo cerca de ti',
            description: 'El equipo Los Invencibles está buscando jugadores.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.sports_soccer,
            title: 'Partido abierto cerca de ti',
            description: 'Hay un partido abierto en tu área.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.person_add,
            title: 'Nuevo seguidor',
            description: 'Jane Smith te ha seguido.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.group,
            title: 'Equipo cerca de ti',
            description: 'El equipo Los Titanes está buscando jugadores.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.sports_soccer,
            title: 'Partido abierto cerca de ti',
            description: 'Partido en Estadio Central esta noche.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.person_add,
            title: 'Nuevo seguidor',
            description: 'John Doe te ha seguido.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.group,
            title: 'Equipo cerca de ti',
            description: 'El equipo Los Invencibles está buscando jugadores.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.sports_soccer,
            title: 'Partido abierto cerca de ti',
            description: 'Hay un partido abierto en tu área.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.person_add,
            title: 'Nuevo seguidor',
            description: 'Jane Smith te ha seguido.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.group,
            title: 'Equipo cerca de ti',
            description: 'El equipo Los Titanes está buscando jugadores.',
            color: const Color(0xFF1E463E),
          ),
          _buildNotificationItem(
            context,
            icon: Icons.sports_soccer,
            title: 'Partido abierto cerca de ti',
            description: 'Partido en Estadio Central esta noche.',
            color: const Color(0xFF1E463E),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
