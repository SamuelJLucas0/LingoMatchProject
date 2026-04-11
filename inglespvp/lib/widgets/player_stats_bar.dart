import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player_model.dart';

class player_stats_bar extends StatelessWidget {
  const player_stats_bar({super.key});
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerModel>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1320),
      ),
      child: Row(
        children: [
          // 🔹 Avatar
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF134487),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
          ),

          const SizedBox(width: 10),

          //  Nombre + nivel
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1F3D),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1C3F7A), width: 1),
                ),
                child: Text(
                  player.gamertag,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x66F9A602),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xFFF9A602), width: 1),
                ),
                child: Text(
                  player.nivel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          _buildStat(Icons.emoji_events, player.copas, Colors.amber),
          const SizedBox(width: 6),
          _buildStat(Icons.monetization_on, player.monedas, Colors.amberAccent),
          const SizedBox(width: 6),
          _buildStat(Icons.favorite, player.vidas, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, int value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1F3D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1C3F7A), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 4),
          Text(
            value.toString().padLeft(3, '0'),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}