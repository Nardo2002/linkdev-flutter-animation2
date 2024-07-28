import 'package:flutter/material.dart';
import 'animated_opacity.dart';
import 'animated_color.dart';
import 'animated_position.dart';
import 'animated_scale.dart';
import 'animated_rotation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tween Animation', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: const Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                AnimatedOpacityWidget(),
                AnimatedColorWidget(),
                AnimatedPositionWidget(),
                AnimatedScaleWidget(),
                AnimatedRotationWidget(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
