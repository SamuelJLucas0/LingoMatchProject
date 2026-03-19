import 'package:flutter/material.dart';
import 'package:inglespvp/widgets/custom_navigation_bar.dart'; 

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos la propiedad oficial para la navegación
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
            _appBarDiseno(),
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
            const SizedBox(height: 10), // Espacio extra antes de la barra
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE COMPONENTES ---

  Widget _appBarDiseno() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF0D2444),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 2)),
      ),
      child: Row(
        children: [
          _nivelCuenta("15"),
          const SizedBox(width: 12),
          const Text("PapuPRO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          const Spacer(),
          const Text("Ingles B1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          const Spacer(),
          _vidaIndicador("5/5"),
        ],
      ),
    );
  }

  Widget _nivelCuenta(String lvl) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.blueAccent, blurRadius: 8)],
      ),
      child: Text(lvl, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _vidaIndicador(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.red, size: 16),
          const SizedBox(width: 5),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _botonMatch() {
    return InkWell(
      onTap: () {}, 
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(12),
          border: const Border(bottom: BorderSide(color: Colors.black45, width: 4)),
        ),
        child: const Text(
          "EMPEZAR EMPAREJAMIENTO", 
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
    );
  }
}