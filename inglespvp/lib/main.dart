import 'package:flutter/material.dart';
import 'package:inglespvp/pages/login_page.dart';
import 'package:inglespvp/pages/pantalla_principal.dart';
import 'package:inglespvp/pages/ranking_page.dart';
import 'package:inglespvp/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InglesPVP',
      initialRoute: 'register',
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   fontFamily: 'Verdana', 
      // ),
      routes: {
        '/' : (BuildContext context) => login_page(),
        'register' : (BuildContext context) => RegisterPage(),
        'pantalla_principal' : (_) => MainMenu(),
        'pagina_rank' : (_) => RankingPage(),
      },
    );
  }
}

