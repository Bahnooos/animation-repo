import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});
  static const screenRoute = 'Size Transition';
  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
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
        child: GestureDetector(
          onTap: _startAnimation,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blueGrey,
            child: Center(
              child: SizeTransition(
                sizeFactor: _animation,
                child: Container(height: 200, width: 200, color: Colors.blue, child: Image.asset('assets/images/jerry.png')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
