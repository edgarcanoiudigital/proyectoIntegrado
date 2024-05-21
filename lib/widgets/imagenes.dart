import 'package:flutter/material.dart';

class ImagenesWidget extends StatelessWidget {
  final String imagen;
  const ImagenesWidget({super.key, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(imagen,);
  }
}
