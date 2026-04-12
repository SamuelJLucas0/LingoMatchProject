import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:inglespvp/models/player_model.dart'; 
import 'package:inglespvp/widgets/custom_navigation_bar.dart';
import 'package:inglespvp/widgets/player_stats_bar.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 2),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298), Colors.black],
          ),
        ),
        child: Column(
          children: [
            const player_stats_bar(),

            const Spacer(),

            const Icon(
              Icons.auto_awesome,
              size: 120,
              color: Colors.cyanAccent,
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "TIP: A medida que subes de rango la gramatica se vuelve mas dificil!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const Spacer(),

            _botonMatch(),

            const SizedBox(height: 10),

            //BOTONES TEMPORALES
            _botonesDebug(context),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔹 BOTÓN MATCH
  Widget _botonMatch() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(12),
          border: const Border(
            bottom: BorderSide(color: Colors.black45, width: 4),
          ),
        ),
        child: const Text(
          "EMPEZAR EMPAREJAMIENTO",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _botonesDebug(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            final player = Provider.of<PlayerModel>(context, listen: false);

            // sumar 5 copas
            player.ganarCopa(player.copas + 5);
          },
          child: const Text("➕ 5 Copas"),
        ),

        const SizedBox(height: 5),

        ElevatedButton(
          onPressed: () {
            final player = Provider.of<PlayerModel>(context, listen: false);

            player.actualizarMonedas(player.monedas + 5);
          },
          child: const Text("💰 +5 Monedas"),
        ),

        const SizedBox(height: 5),

        ElevatedButton(
          onPressed: () {
            final player = Provider.of<PlayerModel>(context, listen: false);

            player.vidas += 1; 
            player.notifyListeners();
          },
          child: const Text("❤️ +1 Vida"),
        ),
      ],
    );
  }
}