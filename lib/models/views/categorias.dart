import 'dart:math';

import 'package:family_fun_time/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class CategoriasViews extends StatefulWidget {
  final List<String> playerNames;
  const CategoriasViews({super.key, required this.playerNames});

  @override
  State<CategoriasViews> createState() => _CategoriasViewsState();
}

class _CategoriasViewsState extends State<CategoriasViews> {
  final Map<String, bool> categories = {
    "Cocina": false,
    "Aire Libre": false,
    "Arte": false,
    "Juegos de mesa": false,
    "Entretenimiento": false,
  };

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

  void _assignRandomActivities(BuildContext context) {
    final random = Random();
    final selectedCategories = categories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            elevation: 10.0,
            backgroundColor: Colors.red[300],
            content: const Text(
              "Debe elegir al menos 1 categoría",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
      );
      return;
    }

    final Map<String, String> playerActivities = {};

    for (final player in widget.playerNames) {
      final category =
          selectedCategories[random.nextInt(selectedCategories.length)];
      final activity =
          activities[category]![random.nextInt(activities[category]!.length)];
      playerActivities[player] = activity;
    }

    Navigator.pushNamed(context, 'ruleta', arguments: {
      'playerNames': widget.playerNames,
      'categories': selectedCategories,
      'playerActivities': playerActivities,
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, Color> _categoryColors = {
      'Cocina': const Color.fromARGB(255, 167, 206, 238),
      'Aire Libre': const Color.fromARGB(255, 239, 184, 202),
      'Arte': const Color.fromARGB(255, 137, 227, 140),
      'Juegos de mesa': const Color.fromARGB(255, 215, 142, 228),
      'Entretenimiento': const Color.fromARGB(255, 242, 212, 166),
    };
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),
           const  Center(
              child:  Text('Elegir Categoría',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),)
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: categories.entries.map((entry) {
                  final color = _categoryColors[entry.key] ?? Colors.grey;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CheckboxListTile(
                      fillColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.green; // Color si está seleccionado
                        }
                        return Colors.black26; // Color por defecto
                      }),
                      tileColor: color,
                      checkColor: const Color.fromARGB(255, 203, 14, 14),
                      activeColor: Colors.blue[100],
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(entry.key),
                      value: entry.value,
                      onChanged: (bool? value) {
                        final selectedCount =
                            categories.values.where((v) => v).length;
                        if (value == false && selectedCount < 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 10.0,
                              backgroundColor: Colors.red[300],
                              content: const Text(
                                "debe elegir al menos 1 categoría ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          );
                          return;
                        }
                        if (value == true && selectedCount >= 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 10.0,
                              backgroundColor: Colors.red[300],
                              content: const Text(
                                "Máximo 3 categorías permitidas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          );
                          return;
                        }
                        setState(
                          () {
                            categories[entry.key] = value ?? false;
                          },
                        );
                        const SizedBox(height: 36);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, 'tipoJuego',arguments: {'playerNames': widget.playerNames}),
                    child: const Text('Regresar')),
                ElevatedButton(
                    onPressed: () => _assignRandomActivities(context),
                    //navigateToRulette(context),
                    child: const Text('Jugar')),
              ],
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
