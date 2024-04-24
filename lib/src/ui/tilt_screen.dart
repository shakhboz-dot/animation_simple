import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_tilt/flutter_tilt.dart';

class TiltDemo extends StatefulWidget {
  const TiltDemo({super.key});

  @override
  State<TiltDemo> createState() => _TiltDemoState();
}

class _TiltDemoState extends State<TiltDemo> {
  int _counter = 0;

  StreamController<TiltStreamModel> tiltStreamModel = StreamController();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Tilt(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(24),
          tiltConfig: const TiltConfig(
            enableGestureTouch: false,
            enableRevert: false,
            enableSensorRevert: false,
            filterQuality: FilterQuality.high,
          ),
          lightConfig: const LightConfig(),
          childLayout: ChildLayout(
            outer: [
              Positioned(
                top: 200,
                child: TiltParallax(
                  size: const Offset(-20, -20),
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: TiltParallax(
                  size: const Offset(25, 25),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      elevation: 0.0,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // onGestureMove:
          //     (TiltDataModel tiltDataModel, GesturesType gesturesType) {
          //   print('--- onGestureMove ---');
          //   print(tiltDataModel.areaProgress);
          //   print(gesturesType.name);
          // },
          // onGestureLeave:
          //     (TiltDataModel tiltDataModel, GesturesType gesturesType) {
          //   print('--- onGestureLeave ---');
          //   print(tiltDataModel.areaProgress);
          //   print(gesturesType.name);
          // },
          child: const MyHomePage(title: 'Flutter Tilt Demo'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Scaffold(
        primary: false,
        backgroundColor: const Color(0x206D6E6F),
        appBar: AppBar(
          primary: false,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
