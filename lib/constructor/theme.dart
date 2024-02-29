import 'package:flutter/material.dart';

ThemeData setTheme() {
  return ThemeData(
    fontFamily: "sukumvit",
    scaffoldBackgroundColor: const Color.fromARGB(255, 247, 246, 246),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
