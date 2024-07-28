import 'package:flutter/material.dart';

class AnimatedCurvesWidget extends StatefulWidget {
  const AnimatedCurvesWidget({super.key});

  @override
  AnimatedCurvesWidgetState createState() => AnimatedCurvesWidgetState();
}

class AnimatedCurvesWidgetState extends State<AnimatedCurvesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  final items = <Curve>[
    Curves.easeInOut,
    Curves.bounceInOut,
    Curves.easeIn,
    Curves.easeOut,
    Curves.elasticInOut,
  ];
  Curve _curve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: _curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return 
               Container(
                width: 150,
                height: 150,
                color: _colorAnimation.value,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _curve = items[(items.indexOf(_curve) + 1) % items.length];
              });
              _controller.forward().then((value) {
                _controller.reverse();
              });
              // print(_curve);
            },
            child: const Text('try different curves'),
          ),
        ),
      ],
    );
  }
}
