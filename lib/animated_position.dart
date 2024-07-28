import 'package:flutter/material.dart';

class AnimatedPositionWidget extends StatefulWidget {
  const AnimatedPositionWidget({super.key});

  @override
  AnimatedPositionWidgetState createState() => AnimatedPositionWidgetState();
}

class AnimatedPositionWidgetState extends State<AnimatedPositionWidget> {
  bool isMoved = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<Offset>(
              begin: const Offset(0, 0),
              end: isMoved ? const Offset(0, 0) : const Offset(20, 20)),
          builder: (BuildContext context, Offset value, Widget? child) {
            return Transform.translate(
              offset: value,
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
                isMoved = !isMoved;
              });
            },
            child: const Text('change position'),
          ),
        ),
      ],
    );
  }
}
