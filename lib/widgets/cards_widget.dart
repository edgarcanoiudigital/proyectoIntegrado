import 'package:family_fun_time/widgets/imagenes.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
     color:Colors.blue[50],
      child: const Column(
        children:  [

          Text('Cocina'),
          SizedBox(
            height: 150,
            child: ImagenesWidget(imagen: 'assets/image1.png'))
        ],
      ),
    );
  }
}
