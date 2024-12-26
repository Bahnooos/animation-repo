import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});
  static const screenRoute = 'Rotation Transition';

  @override
  State<RotationTransitionExample> createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _animation = Tween<double>(begin: 0, end: 7).animate(_controller);
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
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
        title: const Text('Size Transition '),
        centerTitle: true,
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Center(
            child: Container(height: 200, width: 200, color: Colors.blue, child: Image.asset('assets/images/jerry.png')),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.arrow_circle_right_sharp),
      ),
    );
  }
}
