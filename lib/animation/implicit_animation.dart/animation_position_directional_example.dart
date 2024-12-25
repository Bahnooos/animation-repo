import 'package:flutter/material.dart';

class AnimationPositionDirectionalExample extends StatefulWidget {
  const AnimationPositionDirectionalExample({super.key});
  static const screenRoute = 'Animation Position Directional';
  @override
  State<AnimationPositionDirectionalExample> createState() => _AnimationPositionDirectionalExampleState();
}

class _AnimationPositionDirectionalExampleState extends State<AnimationPositionDirectionalExample> {
  double _start = 0.0;
  double _top = 0.0;
  _moveLeft() {
    setState(() => _start < 20 ? _start = 0.0 : _start -= 50);
  }

  _moveRight() {
    setState(() => _start > MediaQuery.sizeOf(context).width - 150 ? MediaQuery.sizeOf(context).width - 150 : _start += 50);
  }

  _moveUp() {
    setState(() => _top < 20 ? 20 : _top -= 50);
  }

  _moveDown() {
    setState(() => _top > MediaQuery.sizeOf(context).height - 300 ? MediaQuery.sizeOf(context).height - 300 : _top += 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Position '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              duration: const Duration(seconds: 1),
              top: _top,
              start: _start,
              curve: Easing.legacy,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
              
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _moveLeft,
                    child: const Icon(Icons.arrow_circle_left_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveRight,
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveUp,
                    child: const Icon(Icons.arrow_circle_up_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveDown,
                    child: const Icon(Icons.arrow_circle_down_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
