import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  //final Map<String, String> playerActivities;

  const ResultsScreen({
    super.key,
    required Map<String, String> playerActivities,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Map<String, String> playerActivities = args['playerActivities'] ?? {};
    final List<String> playerNames = playerActivities.keys.toList();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: playerActivities.length,
                itemBuilder: (context, index) {
                  final player = playerActivities.keys.elementAt(index);
                  final activity = playerActivities[player];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5.0,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[300],
                          child: Text(
                            player.substring(0, 1).toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          player,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(activity ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(255, 215, 64, 1),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'tipoJuego',
                  arguments: {'playerNames': playerNames,}),
              child: const Text(
                'Volver a JUGAR',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'inicio'),
              child: const Text('Terminar'),
            ),
          ],
        ),
      ),
    );
  }
}
