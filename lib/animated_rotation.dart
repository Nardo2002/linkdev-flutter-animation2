import 'package:flutter/material.dart';

class AnimatedRotationWidget extends StatefulWidget {
  const AnimatedRotationWidget({super.key});

  @override
 AnimatedRotationWidgetState createState() => AnimatedRotationWidgetState();
}

class AnimatedRotationWidgetState extends State<AnimatedRotationWidget> {
  bool isRotated = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 1.0, end: isRotated ? 1.0 : 0.0),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.rotate(
              angle: value * 3.14,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blueGrey,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isRotated = !isRotated;
              });
            },
            child: const Text('rotate'),
          ),
        ),
      ],
    );
  }
}
