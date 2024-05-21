import 'package:family_fun_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 50,
        child: LogoPpal(
          imagen: 'assets/logo.png',
        ));
  }
}
