import 'package:dialog_animation/src/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the Motion plugin.
  await Motion.instance.initialize();

  /// Globally set Motion's update interval to 60 frames per second.
  Motion.instance.setUpdateInterval(60.fps);

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
