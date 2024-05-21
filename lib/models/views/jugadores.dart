

import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JugadoresView extends StatefulWidget {
  const JugadoresView({super.key});

  @override
  State<JugadoresView> createState() => _JugadoresViewState();
}

class _JugadoresViewState extends State<JugadoresView> {
  final TextEditingController controller = TextEditingController();

  void _numroJugadores(BuildContext context) {
    final int count = int.tryParse(controller.text) ?? 0;
    if ( count > 0 && count <= 10) {
      Navigator.pushNamed(context, 'nombres',
          arguments: {'playerCount': count});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 10.0,
        backgroundColor: Colors.red[300],
        content: const Text(
          'Ingrese un  número válido, mínimo 1 máximo 10',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
   //final int count = int.tryParse(controller.text) ?? 0;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              '¿Cuantas personas van a jugar?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 250,
                  child: ImagenesWidget(
                    imagen: 'assets/image1.png',
                  ),
                ),
                Expanded(
                    child: TextoInput(
                  //hinttext: 'Nro',
                  controller: controller,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 150.0),
              child: ElevatedButton(
                  onPressed: () {
                    return _numroJugadores(context);
                    /* MaterialPageRoute(
                        builder: (context) => NombreView(
                              playerCount: count,
                            )); */
                  },
                  child: const Text(
                    'Sigamos',
                    style: TextStyle(height: 2),
                  )))
        ],
      ),
    );
  }
}
