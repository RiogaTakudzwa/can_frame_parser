import 'package:flutter/material.dart';

abstract class AppTheme{
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 10,
      actionsIconTheme: IconThemeData(
        color: Colors.white70,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white70,
      ),
    )
  );
}