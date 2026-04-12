import 'package:flutter/material.dart';
import 'package:inglespvp/widgets/custom_navigation_bar.dart';
import 'package:inglespvp/widgets/player_stats_bar.dart';
import 'package:inglespvp/widgets/ranking_card.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3C72),
      body: Column(
        children: [
          const player_stats_bar(),
          
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1),
    );
  }
}