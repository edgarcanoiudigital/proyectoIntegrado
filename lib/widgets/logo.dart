import 'package:flutter/material.dart';

class LogoPpal extends StatelessWidget {
  final String imagen;
  const LogoPpal({super.key, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(imagen);
  }
}
