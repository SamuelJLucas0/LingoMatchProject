import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  
  final String text;
  final Widget leadingIcon; // Usamos Widget para flexibilidad (puedes pasarle un Icon o Image.asset)
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Material( // Material para efecto splash al presionar
        color: backgroundColor,
        elevation: 2.0, // Un poco de sombra
        borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
        child: InkWell( // InkWell para detectar toques y efecto visual
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Container(
            height: 60.0, // Altura fija aproximada a la imagen
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                // Icono/Logo
                Container(
                  width: 30.0,
                  alignment: Alignment.center,
                  child: leadingIcon,
                ),
                
                // Espacio entre el icono y el texto (puedes ajustar el ancho)
                const SizedBox(width: 15.0), 

                // Texto
                Expanded( // Expanded para ocupar el resto del ancho
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500, // Un peso medio
                    ),
                    textAlign: TextAlign.start, // Alineado a la izquierda (después del icono)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}