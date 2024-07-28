import 'package:flutter/material.dart';

class AnimatedColorWidget extends StatefulWidget {
  const AnimatedColorWidget({super.key});

  @override
  AnimatedColorWidgetState createState() => AnimatedColorWidgetState();
}

class AnimatedColorWidgetState extends State<AnimatedColorWidget> {
  bool isBrown = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: ColorTween(
                begin: Colors.brown,
                end: isBrown ? Colors.brown : Colors.blueGrey),
            builder: (context, value, child) {
              return Container(
                width: 150,
                height: 150,
                color: value,
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isBrown = !isBrown;
              });
            },
            child: const Text('change color'),
          ),
        ),
      ],
    );
  }
}
