import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(rank: "1", nombre: "PapuPRO", nivel: "B1", puntos: "2500", color: Colors.amber),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(rank: "2", nombre: "SamDuel", nivel: "A2", puntos: "2100", color: Colors.blueGrey),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(rank: "3", nombre: "ErickNUB", nivel: "A1", puntos: "200", color: const Color.fromARGB(255, 219, 153, 66)),
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String rank;
  final String nombre;
  final String nivel;
  final String puntos;
  final Color color;

  const _SingleCard({
    super.key, 
    required this.rank, 
    required this.nombre, 
    required this.nivel, 
    required this.puntos, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5), 
      height: 70, 
      decoration: BoxDecoration(
        color: const Color(0xFF1D3557),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row( // CAMBIO CLAVE: De Column a Row
          children: [
            // 1. Posición (Rank)
            SizedBox(
              width: 30,
              child: Text(
                rank, 
                style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)
              ),
            ),

            // 2. Avatar pequeño
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color)),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFFDFCF4),
                child: Icon(Icons.person, size: 20, color: Color(0xFF1D3557)),
              ),
            ),

            const SizedBox(width: 15),

            // 3. Nombre y Nivel (En columna pequeña)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'Nivel $nivel',
                    style: TextStyle(color: Colors.cyan.withOpacity(0.8), fontSize: 11),
                  ),
                ],
              ),
            ),

            // 4. Puntuación
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.star, color: Colors.orangeAccent, size: 14),
                Text(
                  '$puntos pts',
                  style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.w900, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}