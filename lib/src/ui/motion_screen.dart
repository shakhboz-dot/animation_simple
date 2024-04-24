import 'package:dialog_animation/src/widget/card_widget.dart';
import 'package:motion/motion.dart';
import 'package:flutter/material.dart' hide Card;

const cardBorderRadius = BorderRadius.all(Radius.circular(25));

class MotionScreen extends StatefulWidget {
  const MotionScreen({super.key});

  @override
  State<MotionScreen> createState() => _MotionScreenState();
}

class _MotionScreenState extends State<MotionScreen> {
  @override
  Widget build(BuildContext context) {
    if (Motion.instance.isPermissionRequired &&
        !Motion.instance.isPermissionGranted) {
      showPermissionRequestDialog(
        context,
        onDone: () {
          setState(() {});
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Motion example',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                    )),
                const Card(
                    width: 280, height: 170, borderRadius: cardBorderRadius),
                Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                      'without Motion',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                const Motion(
                  filterQuality: FilterQuality.high,
                  translation: TranslationConfiguration(),
                  glare: GlareConfiguration(),
                  borderRadius: cardBorderRadius,
                  child: Card(
                      width: 280, height: 170, borderRadius: cardBorderRadius),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'with Motion',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showPermissionRequestDialog(BuildContext context,
      {required Function() onDone}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Permission required'),
              content: const Text(
                  'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Motion.instance.requestPermission();
                  },
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
