import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});
  static const screenRoute = 'Animated Cross Fade';

  @override
  State<AnimatedCrossFadeExample> createState() => _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirstStateVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Cross Fade '),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => _isFirstStateVisible = !_isFirstStateVisible),
          child: AnimatedCrossFade(
            firstCurve: Curves.linear,
            secondCurve: Curves.linear,
            firstChild: Container(
              height: 200,
              width: 200,
              color: Colors.blueGrey,
              child: Image.asset('assets/images/jerry.png'),
            ),
            secondChild: Container(
              height: 200,
              width: 200,
              color: Colors.blueGrey,
              child: Image.asset('assets/images/dog.png'),
            ),
            crossFadeState: _isFirstStateVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 400),
          ),
        ),
      ),
    );
  }
}
