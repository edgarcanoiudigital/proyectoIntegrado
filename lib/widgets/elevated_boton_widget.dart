import 'package:flutter/material.dart';

class ElevatedBotonWidget extends StatelessWidget {
  final String texto;
  final Function? onpressed;
  
  const ElevatedBotonWidget(
      {super.key, required this.texto, required Null Function() onPressed, this.onpressed, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( onPressed: (){}, child: Text(texto) ,
    
    );
  }
}
