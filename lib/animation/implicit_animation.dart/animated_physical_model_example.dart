import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});
  static const screenRoute = 'Animated Physical Model';

  @override
  State<AnimatedPhysicalModelExample> createState() => _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState extends State<AnimatedPhysicalModelExample> {
  bool _ispressed = false;
  _toggleElevation() {
    setState(() => _ispressed = !_ispressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical Model'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleElevation,
          child: AnimatedPhysicalModel(
            curve: Curves.bounceInOut,
            elevation: _ispressed ? 90.0 : 0.0,
            color: Colors.grey,
            shadowColor: Colors.blueGrey,
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/jerry.png'),
            ),
          ),
        ),
      ),
    );
  }
}
