import 'package:flutter/material.dart';

class PositionedDirectionedExample extends StatefulWidget {
  const PositionedDirectionedExample({super.key});
  static const screenRoute = 'Positioned Directional';

  @override
  State<PositionedDirectionedExample> createState() => _PositionedDirectionedExampleState();
}

class _PositionedDirectionedExampleState extends State<PositionedDirectionedExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = RelativeRectTween(begin: const RelativeRect.fromLTRB(0, 0, 0, 0), end: const RelativeRect.fromLTRB(100, 100, 0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
  }

  _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  _resetAnimation() {
    _controller.reverse();
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
        title: const Text('Positioned Directional '),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, Widget? child) => PositionedDirectional(
              bottom: _animation.value.bottom,
              top: _animation.value.top,
              start: _animation.value.left,
              end: _animation.value.right,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Image.asset('assets/images/dog.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 20,
              children: [
                IconButton(
                  onPressed: _startAnimation,
                  icon: const Icon(Icons.start),
                ),
                IconButton(
                  onPressed: _resetAnimation,
                  icon: const Icon(Icons.repeat),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
