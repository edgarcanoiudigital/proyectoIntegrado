// ignore: unused_import
import 'dart:ffi';

import 'package:family_fun_time/models/views/views.dart';

import 'package:family_fun_time/themes/app_themes.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:roulette/roulette.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.ligthTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'inicio',
      routes: {
        'inicio': (context) => const InicioViews(),
        'jugadores': (context) => const JugadoresView(),
        'nombres': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          final playerCount = args['playerCount'] ?? 0;
          return NombreView(playerCount: playerCount);
        },
        'tipoJuego': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          final playerNames = args['playerNames'] ?? [];
          return TipoJuegoView2(playerNames: List<String>.from(playerNames));
        },
        'categoria': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          // ignore: unnecessary_null_comparison
          final playerNames = args != null ? args['playerNames'] ?? [] : [];
          return CategoriasViews(playerNames: List<String>.from(playerNames));
        },
        'ruleta': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          // ignore: unnecessary_null_comparison
          final playersName = args != null ? args['playerNames'] ?? [] : [];
          // ignore: unnecessary_null_comparison
          final categories = args != null ? args['categories'] ?? [] : [];
          final playerActivities =
              // ignore: unnecessary_null_comparison
              args != null ? args['playerActivities'] ?? {} : {};
          return RuletaView(
            playersName:List<String>.from(playersName),
            categories: List<String>.from(categories),
            playerActivities:   Map<String, String>.from(playerActivities)
          );
          
        },
        'resultados': (context) {
           final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          final playerActivities = args != null ? args['playerActivities'] ?? {} : {};
          return ResultsScreen(playerActivities: Map<String, String>.from(playerActivities));
        }
      },
    );
  }
}
