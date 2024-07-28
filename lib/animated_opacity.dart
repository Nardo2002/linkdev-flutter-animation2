import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  AnimatedOpacityWidgetState createState() => AnimatedOpacityWidgetState();
}

class AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> with SingleTickerProviderStateMixin {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 1.0, end: isVisible ? 1.0 : 0.0),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Container(
                    width: 200,
                    height: 200,
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
                isVisible = !isVisible;
              });
            },
            child: const Text('change opacity'),
          ),
        ),
      ],
    );
  }
}

