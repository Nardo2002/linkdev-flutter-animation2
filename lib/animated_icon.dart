import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  AnimatedIconWidgetState createState() => AnimatedIconWidgetState();
}

class AnimatedIconWidgetState extends State<AnimatedIconWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  void _toggleIcon() {
    setState(() {
      if (isPlaying) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
     Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          size: 100.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _toggleIcon,
            child: Text('chaneg to ${isPlaying ? 'Play' : 'Pause'}'),
          ),
        ),
      ],
    );
  }
}