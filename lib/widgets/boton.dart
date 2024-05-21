import 'package:flutter/material.dart';

class BotonWidget extends StatelessWidget {
  final Icon icono;
  final String label;
  final Function onpressed;
  const BotonWidget(
      {super.key,
      required this.icono,
      required this.label,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onpressed(),
      icon: icono,
      label: Text(label),
      style: TextButton.styleFrom(backgroundColor: Colors.red[300],)
    );
  }
}
