import 'dart:async';

import 'package:dialog_animation/src/ui/dialog_screen.dart';
import 'package:dialog_animation/src/ui/main_screen.dart';
import 'package:dialog_animation/src/ui/sensors_screen.dart';
import 'package:dialog_animation/src/ui/tilt_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
