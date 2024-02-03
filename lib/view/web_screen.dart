import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/themes/app_font.dart';
import 'package:infanteapp/widget/button_custom.dart';
import 'package:intl/intl.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  final TextEditingController _dateController1 = TextEditingController();
  final TextEditingController _dateController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController1.text = DateFormat.yMd()
        .format(DateTime.now()); // Inicializa con la fecha actual
    _dateController2.text = DateFormat.yMd()
        .format(DateTime.now()); // Inicializa con la fecha actual
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        controller.text =
            DateFormat.yMd().format(picked); // Formatea la fecha como desees
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Sitios Web'),
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
            const Text('Sitios web más visitados', style: AppFonts.subtitle),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dateController1,
                    readOnly:
                        true, // para que el teclado no aparezca al tocar el TextField
                    decoration: InputDecoration(
                      labelText: 'Fecha inicial',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, _dateController1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _dateController2,
                    readOnly:
                        true, // para que el teclado no aparezca al tocar el TextField
                    decoration: InputDecoration(
                      labelText: 'Fecha final',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, _dateController2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                ButtonCustom(
                  text: "Buscar", // Reemplaza esto con tu texto real
                  onPressed: () {
                    // Tu código aquí
                  },
                  buttonColor: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_open), // Ícono de candado abierto
                    title: Text(
                      'https://www.facebook.com',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '12 horas',
                      style: TextStyle(fontSize: 14), // Estilo normal
                    ),
                  ),
                ],
              ),
            ),
            
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_open), // Ícono de candado abierto
                    title: Text(
                      'https://www.xnxx.com',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '10 horas',
                      style: TextStyle(fontSize: 14), // Estilo normal
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
