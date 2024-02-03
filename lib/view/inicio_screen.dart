import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/view/aplicacion_screen.dart';
import 'package:infanteapp/view/galeria_screen.dart';
import 'package:infanteapp/view/web_screen.dart';
import 'package:lottie/lottie.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _crearBoton('Galería', 'assets/galeria_animation.json',
                      const GaleriaScreen(),context),
                  _crearBoton('Sitios Web', 'assets/web_animation.json',
                      const WebScreen(),context),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _crearBoton('Aplicaciones',
                      'assets/aplicacion_animation.json', const AplicacionScreen(),context),
                  _crearBoton(
                      'GPS', 'assets/galeria_animation.json', const GaleriaScreen(),context),
                ],
              ),
              const SizedBox(height: 30),
              _crearBoton('Contactos', 'assets/galeria_animation.json',
                  const GaleriaScreen(),context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearBoton(String nombre, String rutaAnimacion, Widget vista,BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150.0,
          height: 150.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => vista),
              );
            },
            child: Lottie.asset(rutaAnimacion, fit: BoxFit.contain),
          ),
        ),
        Text(nombre),
      ],
    );
  }
}
