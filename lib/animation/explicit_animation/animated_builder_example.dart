import 'dart:math' show pi;

import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});
  static const screenRoute = 'Animated Builder';

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Builder '),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, Widget? child) => Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.transparent,
                    child: Image.asset('assets/images/dog.png'),
                  ),
                )),
      ),
    );
  }
}
