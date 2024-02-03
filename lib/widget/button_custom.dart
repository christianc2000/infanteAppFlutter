import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_font.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor; // Nuevo parámetro para el color del botón

  const ButtonCustom({super.key, required this.text, required this.onPressed, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.only(left:16.0, right: 16.0, top: 8.0, bottom: 8.0)), // Padding alrededor del texto
        backgroundColor: MaterialStateProperty.all(buttonColor), // Usa el color del botón pasado como parámetro
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))), // Forma del botón
      ),
      child: Text(
        text,
        style: AppFonts.heading3Style, // Color de las letras
      ),
    );
  }
}

