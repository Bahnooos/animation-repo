import 'package:flutter/material.dart';

class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({super.key});
  static const screenRoute = 'Animation Position ';
  @override
  State<AnimatedPositionExample> createState() => _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
  bool _isEating = false;
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
            Positioned(top: 0, left: 0, child: SizedBox(width: 100, height: 100, child: Image.asset('assets/images/cheese.png'))),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: 0,
              left: _isEating ? 0 : MediaQuery.sizeOf(context).width - 120,
              curve: Easing.legacy,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: _isEating ? 0 : MediaQuery.sizeOf(context).height / 2,
              left: _isEating ? 0 : MediaQuery.sizeOf(context).width / 2,
              curve: Easing.legacy,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/dog.png'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 600),
              top: _isEating ? 0 : MediaQuery.sizeOf(context).height - 300,
              left: 0,
              curve: Easing.legacy,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _isEating = !_isEating),
        child: Icon(_isEating ? Icons.back_hand : Icons.start),
      ),
    );
  }
}
