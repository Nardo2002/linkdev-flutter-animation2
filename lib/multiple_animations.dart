import 'package:flutter/material.dart';

class MultipleAnimationsWidget extends StatefulWidget {
  const MultipleAnimationsWidget({super.key});

  @override
  MultipleAnimationsWidgetState createState() =>
      MultipleAnimationsWidgetState();
}

class MultipleAnimationsWidgetState extends State<MultipleAnimationsWidget>
    with SingleTickerProviderStateMixin {
  bool isAnimated = false;
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(20, 20),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = Tween<double>(
      begin: 150.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
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
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.translate(
                offset: _positionAnimation.value,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: Colors.brown,
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isAnimated = !isAnimated;
              });
              if (isAnimated) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: const Text('multiple animations'),
          ),
        ),
      ],
    );
  }
}
