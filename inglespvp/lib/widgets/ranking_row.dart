import 'package:flutter/material.dart';

class RankingRow extends StatelessWidget {
  final RankingPlayer player;

  const RankingRow({super.key, required this.player});

  // Método auxiliar para definir el color del círculo de la posición
  Color _getCircleColor() {
    switch (player.posicion) {
      case 1:
        return const Color(0xFFD49E00); // Oro
      case 2:
        return const Color(0xFF7E8B9B); // Plata
      case 3:
        return const Color(0xFF964B34); // Bronce
      default:
        return const Color(0xFF1E5F74); // Azul para el resto (posiciones 4+)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Espaciado y separación entre filas
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF162A45), // Línea sutil de separación
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // 1. Número de posición dentro de un círculo estilizado
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: _getCircleColor(),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${player.posicion}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 2. Avatar del jugador con borde naranja/amarillo como la imagen
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFB000), width: 2),
            ),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(player.avatarUrl),
            ),
          ),
          const SizedBox(width: 12),

          // 3. Nombre del usuario
          Expanded(
            child: Text(
              player.nombre,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // 4. Puntuación de copas (Icono + número)
          Row(
            children: [
              const Icon(
                Icons.emoji_events, // Icono de trofeo/copa
                color: Color(0xFFFFB000),
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                '${player.copas}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RankingPlayer {
  final int posicion;
  final String nombre;
  final int copas;
  final String avatarUrl;

  RankingPlayer({
    required this.posicion,
    required this.nombre,
    required this.copas,
    required this.avatarUrl,
  });
}