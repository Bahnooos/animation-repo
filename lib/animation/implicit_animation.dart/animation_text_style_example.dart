import 'package:flutter/material.dart';

class AnimationTextStyleExample extends StatefulWidget {
  const AnimationTextStyleExample({super.key});
  static const screenRoute = 'Animation Text Style ';

  @override
  State<AnimationTextStyleExample> createState() => _AnimationTextStyleExampleState();
}

class _AnimationTextStyleExampleState extends State<AnimationTextStyleExample> {
  Color _color = Colors.blueGrey;
  double _fontSize = 20.0;
  _doAnimaton() {
    setState(() {
      _color = Colors.orange;
      _fontSize = 50.0;
    });
  }

  _resetAnimaton() {
    setState(() {
      _color = Colors.blueGrey;
      _fontSize = 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            style: TextStyle(color: _color, fontSize: _fontSize),
            curve: Curves.bounceIn,
            duration: const Duration(milliseconds: 300),
            child: const Text('Hello Banas'),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _doAnimaton,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: _resetAnimaton,
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
