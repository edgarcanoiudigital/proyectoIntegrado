import 'dart:math';
import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TipoJuegoView2 extends StatefulWidget {
  final List<String> playerNames;

  const TipoJuegoView2({super.key, required this.playerNames});

  @override
  // ignore: library_private_types_in_public_api
  _TipoJuegoView2State createState() => _TipoJuegoView2State();
}

class _TipoJuegoView2State extends State<TipoJuegoView2> {
  String? _selectedOption;

  void _assignRandomActivities(BuildContext context) {
    final random = Random();
    final Map<String, List<String>> activities = {
      'Cocina': [
        "Cocina algo rico hoy",
        "Inventa una receta nueva y preparala para tu familia",
        "Cocina un rico postre",
        "Hornea una rica torta",
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

    for (final player in widget.playerNames) {
      final category = activities.keys.elementAt(random.nextInt(activities.keys.length));
      final activity = activities[category]![random.nextInt(activities[category]!.length)];
      playerActivities[player] = activity;
    }

    Navigator.pushNamed(context, 'ruleta', arguments: {
      'playerNames': widget.playerNames,
      'categories': activities.keys.toList(),
      'playerActivities': playerActivities,
    });
  }

  void _navigateBasedOnSelection(BuildContext context) {
    if (_selectedOption == 'Libre') {
      _assignRandomActivities(context);
    } else if (_selectedOption == 'Categoría') {
      Navigator.pushNamed(context, 'categoria', arguments: {
        'playerNames': widget.playerNames,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(255, 244, 167, 167),
                  width: 5
                )
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  
                  value: _selectedOption,
                  hint: const Text('Selecciona una opción'),
                  items: <String>['Libre', 'Categoría'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },
                  dropdownColor: Colors.red[50],
                  borderRadius:BorderRadius.circular(30),
                  icon: const Icon(Icons.arrow_drop_down,color: Colors.red),
                  style: const TextStyle(
                    color:Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold

                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const SizedBox(
              height: 200,
              child: ImagenesWidget(imagen: 'assets/image3.png')),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: _selectedOption != null
                  ? () => _navigateBasedOnSelection(context)
                  : null,
              child: const Text('Jugar'),
            ),
          ),
        ],
      ),
    );
  }
}
