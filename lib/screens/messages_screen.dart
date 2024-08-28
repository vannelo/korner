import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
            top: 64.0, left: 16.0, right: 16.0, bottom: 16.0),
        children: [
          _buildMessageItem(
            context,
            sender: 'Juan Pérez',
            message: 'Hola, ¿estás disponible para un partido?',
            time: '2m ago',
          ),
          _buildMessageItem(
            context,
            sender: 'Los Invencibles',
            message: 'Estamos buscando jugadores para el próximo juego.',
            time: '10m ago',
          ),
          _buildMessageItem(
            context,
            sender: 'Carlos Rodríguez',
            message: '¡Buen juego el de ayer!',
            time: '1h ago',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(
    BuildContext context, {
    required String sender,
    required String message,
    required String time,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          sender.substring(0, 2).toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        // Handle message tap
      },
    );
  }
}
