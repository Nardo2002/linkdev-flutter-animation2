import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({super.key});

  @override
 AnimatedSizeWidgetState createState() => AnimatedSizeWidgetState();
}

class AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  bool didSizeChange = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 1.0, end: didSizeChange ? 0.0 : 1.0),
          builder: (BuildContext context, double value, Widget? child) {
            return Container(
              width: 150 * value,
              height: 150 * value,
              color: Colors.brown,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                didSizeChange = !didSizeChange;
              });
            },
            child: const Text('change size'),
          ),
        ),
      ],
    );
  }
}
