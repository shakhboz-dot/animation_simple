import 'package:dialog_animation/src/ui/dialog_screen.dart';
import 'package:dialog_animation/src/ui/motion_screen.dart';
import 'package:dialog_animation/src/ui/sensors_screen.dart';
import 'package:dialog_animation/src/ui/tilt_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose tilt'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _custom(context);
              },
              child: const Text('Custom'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                _package(context);
              },
              child: const Text('Package'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                _motion(context);
              },
              child: const Text('Motion package'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                _dialog(context);
              },
              child: const Text('Dialog seconder'),
            ),
          ],
        ),
      ),
    );
  }

  void _motion(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MotionScreen();
        },
      ),
    );
  }

  void _dialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const DialogScreen();
        },
      ),
    );
  }

  void _custom(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SensorScreen();
        },
      ),
    );
  }

  void _package(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TiltDemo();
        },
      ),
    );
  }
}
