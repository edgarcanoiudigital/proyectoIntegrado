import 'package:flutter/material.dart';

class TextosWidget extends StatelessWidget {
  final String textos;
  const TextosWidget({super.key, required this.textos});

  @override
  Widget build(BuildContext context) {
    return Text(textos);
  }
}
