import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/themes/app_font.dart';
import 'package:infanteapp/widget/button_custom.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({super.key});

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> {
  bool todoSeleccionado = false;
  List<bool> seleccionados = List.generate(18, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Galería'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ButtonCustom(
                text: "Analizar Galería",
                buttonColor: AppColors.bgPrimaryColor,
                onPressed: () {
                  print("Click en analizar");
                }),
            const Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Text(
                  'Último análisis efectuado fue el 01 de febrero del 2024',
                  style: TextStyle(
                      color: AppColors.bgSecondaryColor1, fontSize: 13)),
            ),
            const SizedBox(height: 20),
            const Text('Contenidos inapropiados encontrados',
                style: AppFonts.subtitle),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity
                  .leading, // coloca el checkbox antes del título
              title: const Text('Seleccionar todo'),
              value: todoSeleccionado,
              onChanged: (bool? valor) {
                setState(() {
                  todoSeleccionado = valor!;
                  seleccionados = List.generate(
                      seleccionados.length, (index) => todoSeleccionado);
                });
              },
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(18, (index) {
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // Aquí puedes agregar los widgets para las imágenes
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Checkbox(
                          value: seleccionados[index],
                          onChanged: (bool? valor) {
                            setState(() {
                              seleccionados[index] = valor!;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0, top: 6.0, bottom: 4.0),
              child: Align(
                alignment:
                    Alignment.centerRight, // alinea el botón a la derecha
                child: ButtonCustom(
                  text: "Eliminar Imagenes",
                  buttonColor: AppColors.bgSecondaryColor1,
                  onPressed: () {
                    print("Click en analizar");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
