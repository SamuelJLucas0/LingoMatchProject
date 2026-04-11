import 'package:flutter/material.dart';
import 'package:inglespvp/pages/pantalla_principal.dart';
import 'package:inglespvp/pages/ranking_page.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Color(0xFF1B1B1B),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(Icons.store, "TIENDA", 0, context),
          _navItem(Icons.emoji_events, "RANKING", 1, context, onTap: () {
             if (currentIndex != 1) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RankingPage()));
             }
          }),
          _battleCenterButton(context),
          _navItem(Icons.star_border, "DESAFÍOS", 3, context),
          _navItem(Icons.folder_copy_outlined, "PROYECTOS", 4, context),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index, BuildContext context, {VoidCallback? onTap}) {
    bool isSelected = currentIndex == index;
    
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.orange : Colors.white70, size: 26),
          const SizedBox(height: 4),
          Text(
            label, 
            style: TextStyle(
              fontSize: 9, 
              color: isSelected ? Colors.orange : Colors.white70,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
            )
          ),
        ],
      ),
    );
  }

  Widget _battleCenterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (currentIndex != 2){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainMenu()));
        }
      },
      child: Transform.translate(
        offset: const Offset(0, -10),
        child: Container(
          width: 75, height: 75,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.orange, Colors.redAccent], 
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(15),
            border: const Border(bottom: BorderSide(color: Color(0xFF5D1010), width: 5)),
            boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 10)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shield, size: 30, color: Colors.white),
              Text("BATALLA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}