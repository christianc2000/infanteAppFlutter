import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/themes/app_font.dart';
import 'package:infanteapp/view/inicio_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:infanteapp/widget/button_custom.dart';

class IngresoScreen extends StatefulWidget {
  const IngresoScreen({super.key});

  @override
  State<IngresoScreen> createState() => _IngresoScreenState();
}

class _IngresoScreenState extends State<IngresoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          // Agrega esto
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Seguridad infantil',
                style: AppFonts.heading1Style,
              ),
              const SizedBox(height: 10),
              const Text(
                'Proteja al infante del contenido',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Lottie.asset("assets/ingreso_animation.json",
                  height: 300.0, repeat: true, reverse: true, animate: true),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Padding a los lados
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese su token',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ButtonCustom(
                text: 'Acceder',
                buttonColor: AppColors.bgPrimaryColor,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioScreen()),
                );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
