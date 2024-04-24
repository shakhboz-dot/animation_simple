import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatefulWidget {
  const SensorScreen({super.key});

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  double dx = 0, dy = 0;

  // @override
  // void initState() {
  //   accelerometerEvents.listen((event) async {
  //     dx = dx + (event.x * 20);
  //     dy = dy + (event.y * 20);
  //     print('DX ------------ $dx');
  //     print('DY ------------ $dy');
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor plus'),
      ),
      body: StreamBuilder<AccelerometerEvent>(
        stream:
            accelerometerEventStream(samplingPeriod: SensorInterval.uiInterval),
        builder: (context, snapshot) {
          final x = snapshot.data?.x ?? 0;
          final y = snapshot.data?.y ?? 0;
          return Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              transform: Matrix4.identity()
                ..rotateX(0.01 * y)
                ..rotateY(-0.01 * x)
                ..translate(x * 30, y * 30),
              alignment: FractionalOffset.center,
              child: Container(
                width: 200,
                height: 300,
                color: Colors.teal,
              ),
            ),
          );
        },
      ),
    );
  }
}
