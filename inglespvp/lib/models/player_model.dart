import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  String gamertag = "PapuPro";
  String nivel = "B1";
  int copas = 5;
  int monedas = 105;
  int vidas = 5;

  // 🔹 Guardar datos del registro/login
  void setUserData(String newGamertag, String newNivel) {
    gamertag = newGamertag;
    nivel = newNivel;
    notifyListeners();
  }

  // 🔹 Métodos dinámicos
  void actualizarMonedas(int value) {
    monedas = value;
    notifyListeners();
  }

  void perderVida() {
    if (vidas > 0) {
      vidas--;
      notifyListeners();
    }
  }

  void ganarCopa(int value) {
    copas = value;
    notifyListeners();
  }
}