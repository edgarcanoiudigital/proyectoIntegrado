import 'dart:math';

import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TipoJuegoView extends StatelessWidget {
final List<String> playerNames;

  const TipoJuegoView(
      {super.key, required this.playerNames,   });

void _assignRandomActivities(BuildContext context) {
    final random = Random();
    final Map<String, List<String>> activities = {
      'Cocina': [
        "Cocina algo delicioso",
        "Inventa una receta",
        "Hacer un postre",
        "Hornea una torta",
        "Un buen asado",
        "Ricas crispetas",
        "Nachos con Guacamole"
      ],
      'Aire Libre': [
        "Jugar escondite",
        "Leer en el parque",
        "Caminata",
        "Excursión al campo",
        "Observar estrellas",
        "Cuenta una historia"
      ],
      'Arte': ["Hacer tarjeta cumpleaños", "Leer un libro", "Dibujo tema libre"],
      'Juegos de mesa': [
        "Jugar cartas",
        "Jugar bingo",
        "Jugar stop",
        "Jugar ahorcado",
        "Jugar parques",
        "Libre elección"
      ],
      'Entretenimiento': [
        "Película de acción",
        "Película de comedia",
        "Película de drama",
        "Película de suspenso",
        "Película de terror",
        "Película animada",
        "Documental"
      ]
    };

    final Map<String, String> playerActivities = {};

    for (final player in playerNames) {
      final category = activities.keys.elementAt(random.nextInt(activities.keys.length));
      final activity = activities[category]![random.nextInt(activities[category]!.length)];
      playerActivities[player] = activity;
    }

    Navigator.pushNamed(context, 'ruleta', 
     
    arguments: {
      'playerNames':playerNames,
      'categiries': activities.keys.toList(),
      'playerActivities': playerActivities,

      });
  }

  



  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: 
          ListView(children: [
              const SizedBox(height: 40),
              
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Text(
                  'Elige Tipo de Juego',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    child: const Text('Libre'),
                    onPressed: () => _assignRandomActivities(context),
                      
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    child: const Text('Categoría'),
                    onPressed: () => Navigator.pushNamed(context, 'categoria',
                    arguments: {'playerNames': playerNames} )),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                  height: 200,
                  child: ImagenesWidget(imagen: 'assets/image3.png')),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  onPressed: () => _assignRandomActivities(context),
                  child: const Text('Jugar'),
                ),
              ),
            ])
          
    );
  }
}
