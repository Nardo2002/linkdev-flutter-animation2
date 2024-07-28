import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({super.key});

  @override
  AnimatedScaleWidgetState createState() => AnimatedScaleWidgetState();
}

class AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  bool didScaleChange = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 1.0, end: didScaleChange ? 1.5: 1.0),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.scale(
              scale: value,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.brown,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                didScaleChange = !didScaleChange;
              });
            },
            child: const Text('change scale'),
          ),
        ),
      ],
    );
  }
}
