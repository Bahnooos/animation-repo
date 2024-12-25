import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});
  static const screenRoute = 'Animated Container';

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color _color = Colors.grey;
  double _radius = 20.0;
  double _width = 100.0;
  double _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceIn,
          child: GestureDetector(
            onTap: () {
              setState(() => _setAnimationValues());
            },
            child: Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_radius),
              ),
              child: Image.asset('assets/images/jerry.png'),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              _color = Colors.grey;
              _radius = 100.0;
              _width = 100.0;
              _height = 100.0;
            });
          },
          child: const Icon(Icons.animation)),
    );
 
  }

  void _setAnimationValues() {
    _color = Colors.orange;
    _height = 400;
    _width = 400;
    _radius = 40;
  }
}
