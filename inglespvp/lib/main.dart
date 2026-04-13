import 'package:flutter/material.dart';
import 'package:inglespvp/pages/login_page.dart';
import 'package:inglespvp/pages/login_page2.dart';
import 'package:inglespvp/pages/pantalla_principal.dart';
import 'package:inglespvp/pages/ranking_page.dart';
import 'package:inglespvp/pages/register_page.dart';

import 'package:provider/provider.dart';
import 'package:inglespvp/models/player_model.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlayerModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InglesPVP',
      initialRoute: '/',
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   fontFamily: 'Verdana', 
      // ),
      routes: {
        '/' : (BuildContext context) => LoginPage2(),
        'register' : (BuildContext context) => RegisterPage(),
        'pantalla_principal' : (_) => MainMenu(),
        'pagina_rank' : (_) => RankingPage(),

      },
    );
  }
}

