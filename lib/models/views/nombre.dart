import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';


class NombreView extends StatefulWidget {
  final int playerCount;

  const NombreView({
    super.key,
    required this.playerCount,
  });

  @override
  State<NombreView> createState() => _NombreViewState();
}

class _NombreViewState extends State<NombreView> {
  final List<TextEditingController> controllers = [];

  @override
  void initState() {
   
     super.initState();
    controllers.clear();
    
      controllers.addAll(
        List.generate(widget.playerCount, (_) => TextEditingController()));
    
    
  }

   void navegarCategoria(BuildContext context) {
    final List<String> playerNames =
        controllers.map((controllers) => controllers.text.trim()).toList();
    if (playerNames.any((name) => name.isEmpty) ) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Por favor ingrese todos los nombre de los jugadores')));

      
    } else {
      Navigator.pushNamed(context, 'tipoJuego',
          arguments: {'playerNames': playerNames});
      
    }
  } 

  @override
  Widget build(BuildContext context) {
    /* 
    if (widget.playerCount == null && widget.playerCount < 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("El número de jugadores no es válido"),
        ),
      );
    } */
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Ingresar el nombre de cada jugador',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.playerCount,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: 
                      
                      TextoInput(
                          labeltext: "Jugador ${i + 1}",
                          hinttext: 'Ingrese nombre jugador ${i + 1}',
                          helpertext: 'Nombre Jugador',
                          controller: controllers[i],
                          keyboardType: TextInputType.name),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, 'jugadores'),
                      child: const Text('Regresar')),
                  ElevatedButton(
                      onPressed: () {
                         // Llama a la función navegarCategoria solo si no hay nombres vacíos
    if (!controllers.any((controller) => controller.text.trim().isEmpty)) {
      navegarCategoria(context);
    } else {
      // Muestra un SnackBar indicando que se deben ingresar todos los nombres
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          elevation: 10.0,
          backgroundColor: Colors.red[300],
          content: const Text('Por favor ingrese todos los nombres de los jugadores',
          textAlign: TextAlign.center,
                                style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),),
        ),
      );
    }
  
                      },
                      child: const Text('Sigamos'))
                ],
              )
            ],
          ),
        ));
  }
}
