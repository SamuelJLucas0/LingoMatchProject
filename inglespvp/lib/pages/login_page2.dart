import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image:  AssetImage('assets/logo_white.png'), fit: BoxFit.contain, width: 250, height: 150,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
   Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF0D2444),
            Color(0xFF07172C),
          ],
        ),
      ),
    );
  }
}