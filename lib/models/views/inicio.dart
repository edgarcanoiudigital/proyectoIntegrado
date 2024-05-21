import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InicioViews extends StatelessWidget {
  const InicioViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarWidget()
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ImagenesWidget(imagen: 'assets/family.png'),
          const SizedBox(height: 150),
          SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: const ButtonStyle(alignment: Alignment.center),
                     onPressed: () {
                      Navigator.pushNamed(context, 'jugadores');
                    }, child: const Center(
                      child:  Text('Vamos a Jugar',
                      style: TextStyle(
                        height: 1,
                      ),
                      textAlign: TextAlign.start)),),
              ))
          // BotonWidget(label: 'Ingresar', icono: const Icon(Icons.family_restroom,), onpressed: (){},),
        ],
      )),
    );
  }
}
