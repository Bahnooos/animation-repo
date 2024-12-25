import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});
  static const String screenRoute = 'Animation Align';

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  int _jerryAlignment = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Align'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getNextAlignment(_jerryAlignment),
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Center(
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: getNextAlignment(_jerryAlignment + 1),
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Center(
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            _jerryAlignment = _jerryAlignment + 1;
            setState(() {});
          },
          child: const Icon(Icons.animation_outlined)),
    );
  }

  Alignment getNextAlignment(int align) {
    switch (align) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        _jerryAlignment = 0;
        return Alignment.topLeft;
    }
  }
}
