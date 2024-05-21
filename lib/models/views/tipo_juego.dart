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
        "Cocina algo rico hoy",
        "Inventa una receta nueva y preparala para tu familia",
        "Cocina un rico postre",
        "HHornea una rica torta",
        "Realizar un buen asado",
        "Prepara unas ricas crispetas",
        "Prepara unos ricos Nachos con Guacamole"
      ],
      'Aire Libre': [
        "Jugar escondite",
        "Organizar una sesión de lectura en un área verde",
        "Realizar una caminata juntos",
        "Ir de excursión a una cascada o una cueva natural",
        "Organizar una sesión de observación de estrellas con un telescopio o simplemente a simple vista.",
        "Contar historias interesantes de cada uno"
      ],
      'Arte': [
        "Hacer tarjetas de cumpleaños o felicitaciones personalizadas para amigos y familiares", 
        "Escoge un buen libro para empezar a leer con tu familia", 
        "Todos juntos Dibujar en una hoja con lapiz un tema de interes y hablar de ello"],

      'Juegos de mesa': [
        "Hora de jugar cartas",
        "JHora de jugar Bingo",
        "Escoger un juego interesante para integrar a la familia",
        "Hora de jugar Stop",
        "Hora de jugar Ahorcado",
        "Hora de jugar Parques"
      ],
      'Entretenimiento': [
        "Escoger una buena pelicula de Acción para ver juntos",
        "Escoger una buena pelicula de Comedia para ver juntos",
        "Escoger una buena pelicula de Drama para ver juntos",
        "Escoger una buena pelicula de Suspenso para ver juntos",
        "Escoger una buena pelicula de Terror para ver juntos",
        "Escoger una buena pelicula de Animada para ver juntos",
        "Escoger una buen documental para ver juntosl",
        "Hacer una maratón de películas",
        "Ver TV juntos"
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
