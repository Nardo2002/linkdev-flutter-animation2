import 'package:flutter/material.dart';
import 'animated_opacity.dart';

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
          child: Column(
            children: [
              AnimatedOpacityWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
