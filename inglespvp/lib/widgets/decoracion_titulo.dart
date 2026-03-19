import 'package:flutter/material.dart';

class decoracion_titulo extends StatelessWidget {
  final String titulo;
  decoracion_titulo({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //ocupar todo ancho
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.cyan, width: 2.5))
      ),
      child: Text(
        titulo,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
      ),
    );
  }
}