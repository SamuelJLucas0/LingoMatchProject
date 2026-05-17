import 'package:flutter/material.dart';

// ==========================================
// MODELO DE DATOS
// ==========================================
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

// ==========================================
// WIDGET DE LA BARRA DE ESTADÍSTICAS SUPERIOR
// ==========================================
class TopStatsBar extends StatelessWidget {
  const TopStatsBar({super.key});

  Widget _buildStatItem(String text, IconData icon, Color iconColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("PapuPro", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Row(
              children: [
                _buildStatItem("B1", Icons.stars, Colors.blue, const Color(0xFF162A45)),
                const SizedBox(width: 5),
                _buildStatItem("005", Icons.monetization_on, Colors.yellow[700]!, const Color(0xFF162A45)),
                const SizedBox(width: 5),
                _buildStatItem("105", Icons.emoji_events, Colors.orange, const Color(0xFF162A45)),
                const SizedBox(width: 5),
                _buildStatItem("05", Icons.favorite, Colors.red, const Color(0xFF162A45)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. WIDGET DE LA FILA DEL RANKING
// ==========================================
class RankingRow extends StatelessWidget {
  final RankingPlayer player;
  const RankingRow({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    Color circleColor = const Color(0xFF164863);
    if (player.posicion == 1) circleColor = const Color(0xFFB17E00);
    if (player.posicion == 2) circleColor = const Color(0xFF6B7480);
    if (player.posicion == 3) circleColor = const Color(0xFF863E2B);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white10))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: circleColor,
            child: Text('${player.posicion}', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: Color(0xFFFFB000), shape: BoxShape.circle),
            child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(player.avatarUrl)),
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(player.nombre, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Color(0xFFFFB000), size: 18),
              const SizedBox(width: 5),
              Text('${player.copas}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. PANTALLA PRINCIPAL
// ==========================================
class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RankingPlayer> listaRanking = List.generate(10, (index) => 
      RankingPlayer(posicion: index + 1, nombre: 'PapuProGamer777', copas: 117, avatarUrl: 'https://i.pravatar.cc/150?u=$index')
    );

    return Scaffold(
      backgroundColor: const Color(0xFF07162C),
      body: Column(
        children: [
          const TopStatsBar(), // Barra de nombre y recursos
          
          // Cabecera de Liga
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(color: Color(0xFF0F2B48)),
            child: Column(
              children: [
                const Icon(Icons.workspace_premium, color: Color(0xFFFFB000), size: 50),
                const Text('INGLES B1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.timer, color: Colors.blueGrey, size: 14),
                    SizedBox(width: 5),
                    Text('Finaliza en 11h 38m', style: TextStyle(color: Colors.blueGrey)),
                  ],
                ),
              ],
            ),
          ),

          // Pestañas
          Container(
            color: const Color(0xFF0F2B48),
            child: Row(
              children: [
                _buildTab("Tu nivel", true),
                _buildTab("Amigos", false),
              ],
            ),
          ),

          // Header de tabla
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Posición', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                Text('Copas 🏆', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Lista
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: listaRanking.length,
              itemBuilder: (context, index) => RankingRow(player: listaRanking[index]),
            ),
          ),
        ],
      ),
      
      // MENÚ DE ABAJO
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF0F2B48),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomAction(Icons.store, "Tienda"),
              _bottomAction(Icons.bar_chart, "Ranking", isSelected: true),
              
              // BOTÓN BATALLA (Central y Naranja)
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'pantalla_principal'),
                child: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF823A),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]
                  ),
                  child: const Icon(Icons.shield, color: Colors.white, size: 35),
                ),
              ),

              _bottomAction(Icons.ads_click, "Desafíos"),
              _bottomAction(Icons.menu_book, "Manual"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: active ? Colors.white : Colors.transparent, width: 3))
        ),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: active ? Colors.white : Colors.blueGrey, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _bottomAction(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? const Color(0xFFFFB000) : Colors.blueGrey),
        Text(label, style: TextStyle(color: isSelected ? const Color(0xFFFFB000) : Colors.blueGrey, fontSize: 12)),
      ],
    );
  }
}