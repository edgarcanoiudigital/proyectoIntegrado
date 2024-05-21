import 'package:flutter/material.dart';

class AppTheme {
  static Color? primerColor = Colors.red[300];
  static Color? segundoColor = Colors.yellow[50];
  static Color? tercerColor = Colors.green[200];
  static final ThemeData ligthTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: segundoColor,
      appBarTheme: AppBarTheme(
        backgroundColor: tercerColor,
        elevation: 10,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: segundoColor, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          foregroundColor: segundoColor,
          backgroundColor: primerColor,
          elevation: 10,
          textStyle: const TextStyle(
              fontSize:30,
              height: 2,
              
              fontWeight: FontWeight.bold),
        ),
      ));
}
