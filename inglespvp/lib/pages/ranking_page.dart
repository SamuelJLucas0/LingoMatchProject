import 'package:flutter/material.dart';
import 'package:inglespvp/widgets/custom_navigation_bar.dart';
import 'package:inglespvp/widgets/ranking_card.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOP PLAYERS"), 
        backgroundColor: const Color(0xFF0D2444),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1E3C72),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RankingCard(),
                ],
              )
            ],
          )
        ]
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1),
    );
  }
}