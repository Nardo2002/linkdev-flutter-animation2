import 'package:flutter/material.dart';

class AnimatedShapeWidget extends StatefulWidget {
  const AnimatedShapeWidget({super.key});

  @override
AnimatedShapeWidgetState createState() => AnimatedShapeWidgetState();
}

class AnimatedShapeWidgetState extends State<AnimatedShapeWidget> {
  bool isCircle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<BorderRadius>(begin: BorderRadius.circular(75), end: BorderRadius.circular(isCircle ? 75 : 0)),
          builder: (BuildContext context, BorderRadius value, Widget? child) {
            return Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: value,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isCircle = !isCircle;
              });
            },
            child: const Text('change shape'),
          ),
        ),
      ],
    );
  }
}
